import pytest
from main import greeting


@pytest.mark.parametrize('name,expected', [('Никита', 'Привет, Никита')])
def test_greeting(name: str, expected: str):
    """Текст приветствия зависит от имени."""
    assert greeting(name) == expected


def test_capitalize():
    """Все слова в имени начинаются с большой буквы."""
    name = 'яндекс практикум'
    name = name.title()
    assert greeting(name) == 'Привет, Яндекс Практикум'
