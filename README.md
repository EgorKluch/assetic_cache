# assetic_cache
### Подготовка
```bash
# Разворачиваем репозиторий
cd $pathToAssCache;
git clone https://github.com/EgorKluch/assetic_cache.git;
# Cоздаем alias для команды кэширования
alias assCache="$pathToAssCache/saveAssCache.sh";
# Подготавливаем проект к кэшированию
cd $pathToProject
$pathToAssCache/initAssCache.sh
```

### Использование
```bash
# Сохраняем текущие кэши. Для каждой ветки создается собственная ветка с кэшами. Для корректной работы следить, что сохраняются собранные кэши
git checkout someBranch
# Собираем ассетики полностью
app/console assetic:dump --watch -v --force
assCache # Сохраняем кэши для ветки someBranch

git checkout otherBranch
# Если ассетики для ветки otherBranch были сохранены, они загрузятся
assCache -l
# Теперь собирать проект нет необходимости, все уже собрано
# Для отслеживания изменений, также запускаем watcher без полной пересборки
app/console assetic:dump --watch -v
```
