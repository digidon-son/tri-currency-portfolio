# Программа сбалансированного бивалютного портфеля на три валюты: евро, доллары и рубли.
# Все операции проводятся в рублях, как в основной валюте.

# Подключаем класс локализации и сбалансированного портфеля
require_relative 'lib/currency_portfolio'
require_relative 'lib/localization'

# В начале предлагаем пользователю выбрать язык
puts 'Выберите язык(Choose language):'
puts '1. Русский(Russian)'
puts '2. Английский(English)'
locale = gets.to_i
unless (1..2).include?(locale)
  puts 'Язык по умолчанию: Русский.'
  locale = 1
end

# Инициализируем класс локализации
language = Localization.new

# Курс долларов
puts language.translate('ask_rate_usd', locale)
rate_usd = gets.to_f

# Курс евро
puts language.translate('ask_rate_eur', locale)
rate_eur = gets.to_f

# Спросим у пользователя количество рублей
puts language.translate('ask_rubles', locale)
rub = gets.to_f

# Количество евро
puts language.translate('ask_eur', locale)
eur = gets.to_f

# Количество долларов
puts language.translate('ask_dollars', locale)
usd = gets.to_f

# Инициализируем класс портфеля
balanced = CurrencyPortfolio.new(rate_usd: rate_usd, rate_eur: rate_eur, rub: rub,
                                 eur: eur, usd: usd, language: language, locale: locale)

# Выводим рекомендации по балансу Евро
puts language.translate('eur', locale)
puts balanced.balance(eur, rate_eur)
puts

# Выводим рекомендации по балансу доллара США
puts language.translate('usd', locale)
puts balanced.balance(usd, rate_usd)
puts
