# [IC-I] Health Nade

Расширение добавляет тип предмета `HealthNade`. Интеграция с плагином [[fork] Healthnade](https://github.com/Giferns/HealthNade/releases) версии `0.0.22f` и выше.

## Параметры

| Название             | Тип      | По умолчанию | Описание                                              |
| :------------------- | :------- | :----------- | :---------------------------------------------------- |
| `Count`              | Ц. Число | 1            | Сколько гранат выдать                                 |
| `MaxCount`           | Ц. Число | 1            | ВЫше какого числа гранаты не будут выдаваться         |
| `ThrowHealingAmount` | Д. Число | -1.0         | Количество восстанавливаемых ХП при взрыве гранаты    |
| `DrinkHealingAmount` | Д. Число | -1.0         | Количество восстанавливаемых ХП при выпивании гранаты |
| `ExplodeRadius`      | Д. Число | -1.0         | Радиус взрыва гранаты                                 |

- Значения меньше нуля означают использование параметров, указанных в настройках `HealthNade`.

## Пресеты

- `File:Items/HealthNade/Default` - Обычная хилка
- `File:Items/HealthNade/Improved` - Улучшенная хилка (повышен радиус на 50 и кол-во хп по 5 на каждый способ)
- `File:Items/HealthNade/Imbalanced` - Дисбалансная хилка. Восполняет 9999 ХП в радиусе 10000 единиц
