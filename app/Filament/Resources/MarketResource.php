<?php

namespace App\Filament\Resources;

use App\Filament\Resources\MarketResource\Pages;
use App\Filament\Resources\MarketResource\RelationManagers;
use App\Models\Market;
use Filament\Forms;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Columns\ImageColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\Facades\Storage;

class MarketResource extends Resource
{
    protected static ?string $model = Market::class;

    protected static ?string $navigationIcon = 'heroicon-o-shopping-cart';

    protected static ?string $navigationGroup = 'E-Learning';

    protected static ?int $navigationSort = 6;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                TextInput::make('title')
                    ->label('Title')
                    ->required()
                    ->columnSpanFull(),

                Select::make('type')
                    ->label('Quest Type')
                    ->options([
                        'Avatar' => 'Avatar',
                        'Gift' => 'Gift',
                    ])
                    ->required()
                    ->reactive()
                    ->columnSpanFull(),

                TextInput::make('price')
                    ->label("Item's Price")
                    ->required()
                    ->integer()
                    ->default(0),

                FileUpload::make('picture')
                    ->label('Picture')
                    ->image()
                    ->required()
                    ->directory('market/images')
                    ->getUploadedFileNameForStorageUsing(fn($file) => Storage::url($file->hashName()))
                    ->columnSpanFull(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('title')
                    ->label("Title"),
                Tables\Columns\TextColumn::make('price')
                    ->label("Price"),
                Tables\Columns\TextColumn::make('type')
                    ->label("Type")
                    ->badge(),
                ImageColumn::make('picture')
                    ->label('Picture')
                    ->size(50)
                    ->url(fn($record) => Storage::url($record->picture)),
                Tables\Columns\TextColumn::make('creator.name')
                    ->label("Created By")
                    ->formatStateUsing(fn($record) => $record->creator->name . "<br/> <hr/>" . $record->created_at)
                    ->html(),
                Tables\Columns\TextColumn::make('updater.name')
                    ->label("Updated By")
                    ->formatStateUsing(fn($record) => $record->updater->name . "<br/> <hr/>" . $record->updated_at)
                    ->html(),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
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
            'index' => Pages\ListMarkets::route('/'),
            'create' => Pages\CreateMarket::route('/create'),
            'edit' => Pages\EditMarket::route('/{record}/edit'),
        ];
    }
}
