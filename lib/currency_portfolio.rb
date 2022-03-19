# Класс для баланса портфеля
class CurrencyPortfolio
  def initialize(params)
    @rate_usd = params[:rate_usd]
    @rate_eur = params[:rate_eur]
    @rub = params[:rub]
    @eur = params[:eur]
    @usd = params[:usd]
    @language = params[:language]
    @locale = params[:locale]
  end

  def calculate_the_balance
    # Сбалансированная доля
    (@rub + @rate_eur * @eur + @rate_usd * @usd) / 3
  end

  # Метод балансировки.
  # В качестве аргументов передается количество в необходимой валюте и курс этой валюты
  def balance(currency, rate)
    disbalance = (currency * rate - calculate_the_balance)
    if disbalance.round.zero?
      @language.translate('balanced', @locale)
    elsif disbalance.round(2).positive?
      "#{@language.translate('sell', @locale)} #{disbalance.round(2)} rub."
    else
      "#{@language.translate('buy', @locale)} #{disbalance.round(2).abs} rub."
    end
  end
end
