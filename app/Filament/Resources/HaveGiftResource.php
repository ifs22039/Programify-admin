<?php

namespace App\Filament\Resources;

use App\Filament\Resources\HaveGiftResource\Pages;
use App\Filament\Resources\HaveGiftResource\RelationManagers;
use App\Models\HaveGift;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Columns\ImageColumn;
use Filament\Tables\Columns\ToggleColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\Facades\Storage;

class HaveGiftResource extends Resource
{
    protected static ?string $model = HaveGift::class;

    protected static ?string $navigationIcon = 'heroicon-o-ticket';

    protected static ?string $navigationGroup = 'E-Learning';

    protected static ?int $navigationSort = 7;

    protected static ?string $navigationLabel = 'Vouchers';

    public static function getNavigationLabel(): string
    {
        return 'Vouchers';
    }

    public static function canCreate(): bool
    {
        return false;
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                //
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                ImageColumn::make('gift.picture')
                    ->label('Picture')
                    ->size(75)
                    ->url(fn($record) => Storage::url($record->picture)),
                Tables\Columns\TextColumn::make('gift.title')
                    ->label("Title")
                    ->searchable(),
                Tables\Columns\TextColumn::make('gift.price')
                    ->label("Picture")
                    ->numeric(),
                Tables\Columns\TextColumn::make('owner.name')
                    ->label("Owner")
                    ->searchable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->label("Date")
                    ->numeric(),
                ToggleColumn::make('is_active')
                    ->label('Active')
                    ->afterStateUpdated(fn($record, $state) => $record->update(['is_active' => $state])),
            ])
            ->filters([
                //
            ])
            ->actions([])
            ->bulkActions([]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListHaveGifts::route('/'),
            'create' => Pages\CreateHaveGift::route('/create'),
            'edit' => Pages\EditHaveGift::route('/{record}/edit'),
        ];
    }
}
