# Register your models here.
from django.contrib import admin

from .models import Genre, Person, Filmwork, GenreFilmwork, PersonFilmwork


@admin.register(Genre)
class GenreAdmin(admin.ModelAdmin):
    pass


@admin.register(Person)
class PersonAdmin(admin.ModelAdmin):
    pass


class GenreFilmworkInline(admin.TabularInline):
    model = GenreFilmwork


class PersonFilmworkInline(admin.TabularInline):
    model = PersonFilmwork


@admin.register(Filmwork)
class FilmworkAdmin(admin.ModelAdmin):
    inlines = (GenreFilmworkInline, PersonFilmworkInline,)

    # Отображение полей в списке
    list_display = ('title', 'type', 'creation_date', 'rating',)

    # Фильтрация в списке
    list_filter = ('type', 'genres')

    # Поиск по полям
    search_fields = ('title', 'description', 'id')
