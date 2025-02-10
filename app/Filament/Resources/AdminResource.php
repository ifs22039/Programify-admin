<?php

namespace App\Filament\Resources;

use App\Filament\Resources\AdminResource\Pages;
use App\Filament\Resources\AdminResource\RelationManagers;
use App\Models\Admin;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\Facades\Hash;

class AdminResource extends Resource
{
    protected static ?string $model = Admin::class;

    protected static ?string $navigationIcon = 'heroicon-o-user-group';

    protected static ?string $navigationGroup = 'Master Data';

    public static function shouldRegisterNavigation(): bool
    {
        if (auth()->user()->is_super) {
            return true;
        }
        return false;
    }

    public static function canViewAny(): bool
    {
        return auth()->user()->is_super ?? false;
    }

    public static function canCreate(): bool
    {
        return auth()->user()->is_super ?? false;
    }

    public static function canEdit($record): bool
    {
        return auth()->user()->is_super ?? false;
    }

    public static function canDelete($record): bool
    {
        return auth()->user()->is_super ?? false;
    }

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
                Tables\Columns\TextColumn::make('name'),
                Tables\Columns\TextColumn::make('email'),
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
            'index' => Pages\ListAdmins::route('/'),
            'create' => Pages\CreateAdmin::route('/create'),
            'edit' => Pages\EditAdmin::route('/{record}/edit'),
        ];
    }
}
