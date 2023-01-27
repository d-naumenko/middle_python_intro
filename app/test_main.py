import pytest
from main import *


@pytest.mark.parametrize( 'name,expected', [('Никита', 'Привет, Никита'), ('Ольга', 'Привет, Ольга')],)
def test_greeting(name: str, expected: str):
    """Текст приветствия зависит от имени."""
    assert Greeting(name) == expected

def test_capitalize():
    """Все слова в имени начинаются с большой буквы."""
    name = 'яндекс практикум'
    assert Greeting(name) == 'Привет, Яндекс Практикум'
