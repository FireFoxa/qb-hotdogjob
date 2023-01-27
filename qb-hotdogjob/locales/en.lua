local Translations = {
    error = {
        no_money = 'Нямате достатъчно средства',
        too_far = 'Вие сте твърде далеч от вашия щанд за хот дог',
        no_stand = 'Нямате щанд за хотдог',
        cust_refused = 'Клиентът е отказан!',
        no_stand_found = 'Вашият щанд за хот дог не се виждаше никъде, няма да получите депозита си обратно!',
        no_more = 'Ти нямаш %{value} повече за това пред съвета',
        deposit_notreturned = 'Не сте имали щанд за хот дог',
    },
    success = {
        deposit = 'Платихте $%{deposit} депозит!',
        deposit_returned = 'Вашият депозит от $%{deposit} е върнат!',
        sold_hotdogs = '%{value} x хотдога(\'s) продадени за $%{value2}',
        made_hotdog = 'Вие направихте  %{value} хотдога',
        made_luck_hotdog = 'Направихте %{value} x %{value2} хотдога',
    },
    info = {
        command = "Delete Stand (Admin Only)",
        blip_name = 'Продавач на хотдози',
        start_working = '[~g~E~s~] Започнете работа',
        start_work = 'Започнете работа',
        stop_working = '[~g~E~s~] Спрете работа',
        stop_work = 'Спрете работа',
        grab_stall = '[~g~G~s~] Хванете сергията',
        drop_stall = '[~g~G~s~] Пуснете сергията',
        grab = 'Хванете сергията',
        selling_prep = '[~g~E~s~] Приготвяне [Продажба: ~g~Продажба~w~]',
        not_selling = '[~g~E~s~] Приготвяне [Продажба: ~r~НЕ продавате~w~]',
        sell_dogs = '[~g~7~s~] Продайте %{value} x хотдога за $%{value2} / [~g~8~s~] Отказ',
        admin_removed = "Поставката за хот дог е премахната",
        label_a = "Перфектен (A)",
        label_b = "Рядко (B)",
        label_c = "Често срещан (C)"
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})