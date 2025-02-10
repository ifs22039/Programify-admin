<?php

namespace App\Filament\Resources;

use App\Filament\Resources\UserResource\Pages;
use App\Filament\Resources\UserResource\RelationManagers;
use App\Models\User;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class UserResource extends Resource
{
    protected static ?string $model = User::class;

    protected static ?string $navigationIcon = 'heroicon-o-user';

    protected static ?string $navigationGroup = 'Master Data';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('name')
                    ->required(fn($livewire) => !$livewire->getRecord())
                    ->maxLength(255)
                    ->columnSpanFull(),
                Forms\Components\TextInput::make('email')
                    ->required(fn($livewire) => !$livewire->getRecord())
                    ->email()
                    ->maxLength(255)
                    ->columnSpanFull()
                    ->unique(fn($livewire) => $livewire->getRecord())
                    ->disabled(fn($livewire) => $livewire->getRecord()),
                Forms\Components\TextInput::make('password')
                    ->required(fn($livewire) => !$livewire->getRecord())
                    ->maxLength(255)
                    ->columnSpanFull()
                    ->password()
                    ->confirmed(),
                Forms\Components\TextInput::make('password_confirmation')
                    ->label("Password Confirmation")
                    ->password()
                    ->required(fn($livewire) => !$livewire->getRecord())
                    ->columnSpanFull()
                    ->maxLength(255)
                    ->dehydrated(false),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name')
                    ->label("Name"),
                Tables\Columns\TextColumn::make('email')
                    ->label("Email"),
                Tables\Columns\TextColumn::make('accountLevel.level')
                    ->label("Level"),
                Tables\Columns\TextColumn::make('total_point')
                    ->label("Total Point"),
                Tables\Columns\TextColumn::make('total_exp')
                    ->label("Total Exp"),
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
            'index' => Pages\ListUsers::route('/'),
            'create' => Pages\CreateUser::route('/create'),
            'edit' => Pages\EditUser::route('/{record}/edit'),
        ];
    }
}
