# Класс ответственный за локализацию программы
class Localization
  TRANSLATIONS = [
    ['ask_rubles', 'Количество рублей?', 'Amount of rubles?'],
    ['ask_dollars', 'Количество долларов?', 'Amount of dollars?'],
    ['ask_rate_usd', 'Курс долларов?', 'USD exchange rate?'],
    ['ask_rate_eur', 'Курс евро?', 'Euro exchange rate?'],
    ['ask_eur', 'Количество евро?', 'Amount of euros?'],
    ['usd', 'Доллары:', 'USD:'],
    ['eur', 'Евро:', 'Euro:'],
    ['balanced', 'Валюта сбалансирована', 'Currency is balanced'],
    ['sell', 'Необходимо продать валюту на', 'Need to sell currency on'],
    ['buy', 'Необходимо преобрести валюту на', 'Need to buy currency on']
  ]
  # Добавляем self метод, в котором хранится массив со строками
  def translate(phrase, locale)
    index = (locale == 1 ? 1 : 2)

    translation = TRANSLATIONS.find { |t| t[0] == phrase }

    translation[index]
  end
end
