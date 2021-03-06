#!/bin/bash
source "sKitty.sh"
 HEAD(){ for (( a=2; a<=23; a++ ))
  do
 TPUT $a 1
        $E "\033[1;35m\xE2\x94\x82                                                                                \xE2\x94\x82\033[0m";
  done
 TPUT 3 1
        $E "\033[0m\033[35m+- Передовой ----------------------------- Advanced -----------------------------+\033[0m";
 TPUT 21 1
        $E "\033[0m\033[35m+--- Up \xE2\x86\x91 \xE2\x86\x93 Down Select Enter ---------------------------------------------------+\033[0m";
 MARK;TPUT 1 1
        $E "$c";UNMARK;}
   i=0; CLEAR; CIVIS;NULL=/dev/null
# 32 это расстояние сверху и 48 это расстояние слева
   FOOT(){ MARK;TPUT 24 1
        $E "$c";UNMARK;}
# это управляет кнопками ввер/хвниз
 i=0; CLEAR; CIVIS;NULL=/dev/null
#
  M0(){ TPUT  5 3; $e " Программа оболочки для выполнения           \e[32m shell                          \e[0m";}
  M1(){ TPUT  6 3; $e " Редактор терминала                          \e[32m editor                         \e[0m";}
  M2(){ TPUT  7 3; $e " Закройте окно, когда дочерний процесс выйдет\e[32m close_on_child_death           \e[0m";}
  M3(){ TPUT  8 3; $e " Разрешить другим программам управлять kitty \e[32m allow_remote_control           \e[0m";}
  M4(){ TPUT  9 3; $e " Слушать указанный сокет unix/tcp            \e[32m listen_on                      \e[0m";}
  M5(){ TPUT 10 3; $e " Укажите переменные среды во всех дочерних   \e[32m env                            \e[0m";}
  M6(){ TPUT 11 3; $e " Путь к файлу python                         \e[32m watcher                        \e[0m";}
  M7(){ TPUT 12 3; $e " Контролируйте, поиск программы для запуска  \e[32m exe_search_path                \e[0m";}
  M8(){ TPUT 13 3; $e " Проверяйте, доступно ли обновление          \e[32m update_check_interval 24       \e[0m";}
  M9(){ TPUT 14 3; $e " Путь к файлу сеанса                         \e[32m startup_session none           \e[0m";}
 M10(){ TPUT 15 3; $e " Разрешить читать и писать из буфера обмена  \e[32m clipboard_control              \e[0m";}
 M11(){ TPUT 16 3; $e " Максимальный размер (в МБ) данных           \e[32m clipboard_max_size             \e[0m";}
 M12(){ TPUT 17 3; $e " Пароль, для передачи файлов               \e[32m file_transfer_confirmation_bypass\e[0m";}
 M13(){ TPUT 18 3; $e " Обрабатывать управляющие последовательности \e[32m allow_hyperlinks               \e[0m";}
 M14(){ TPUT 19 3; $e " Включите интеграцию оболочки в оболочках    \e[32m shell_integration              \e[0m";}
 M15(){ TPUT 20 3; $e " Значение переменной среды TERM              \e[32m term                           \e[0m";}
#
 M16(){ TPUT 22 3; $e " \e[90mExit                                                                        \e[0m";}
LM=16
   MENU(){ for each in $(seq 0 $LM);do M${each};done;}
    POS(){ if [[ $cur == up ]];then ((i--));fi
           if [[ $cur == dn ]];then ((i++));fi
           if [[ $i -lt 0   ]];then i=$LM;fi
           if [[ $i -gt $LM ]];then i=0;fi;}
REFRESH(){ after=$((i+1)); before=$((i-1))
           if [[ $before -lt 0  ]];then before=$LM;fi
           if [[ $after -gt $LM ]];then after=0;fi
           if [[ $j -lt $i      ]];then UNMARK;M$before;else UNMARK;M$after;fi
           if [[ $after -eq 0 ]] || [ $before -eq $LM ];then
           UNMARK; M$before; M$after;fi;j=$i;UNMARK;M$before;M$after;}
   INIT(){ R;HEAD;FOOT;MENU;}
     SC(){ REFRESH;MARK;$S;$b;cur=`ARROW`;}
# Функция возвращения в меню
     ES(){ MARK;$e " ENTER = main menu ";$b;read;INIT;};INIT
  while [[ "$O" != " " ]]; do case $i in
  0) S=M0;SC; if [[ $cur == enter ]];then R;echo -e "
 Программа оболочки для выполнения.
 Значение по умолчанию для .means использовать любую оболочку,
 установленную в качестве оболочки по умолчанию для текущего пользователя.
 Обратите внимание, что в macOS, если вы измените это, вам может потребоваться
 добавить --login и --interactive,
 чтобы убедиться, что оболочка запускается в интерактивном режиме
 и читает свои файлы запуска rc.
\e[32m shell .\e[0m";ES;fi;;
  1) S=M1;SC; if [[ $cur == enter ]];then R;echo -e "
 Редактор терминала (например,vim или nano) для использования при редактировании
 файла конфигурации kitty или подобных задач \`\`. means\`\` по умолчанию для
 \`\`. means\`\` использование переменных среды VISUAL и EDITOR именно в таком порядке
 Если эти переменные не установлены, kitty запустит вашу оболочку:
 (\`\`$SHELL -l -i -c env\`\`), чтобы увидеть, установлен ли в файлах конфигурации
 вашей оболочки VISUAL или EDITOR. Если это не сработает, kitty будет циклически
 переключаться между различными известными редакторами:
 (\`\`vim\`\`, \`\`emacs\`\` и т. д.)
 и выбирать первый из существующих в вашей системе.
\e[32m editor .\e[0m";ES;fi;;
  2) S=M2;SC; if [[ $cur == enter ]];then R;echo -e "
 Закройте окно, когда дочерний процесс (оболочка) выйдет.
 Если нет (по умолчанию), терминал останется открытым, когда дочерний процесс
 выйдет, пока есть процессы, выводящие данные на терминал (например,
 неиспользуемые или фоновые процессы). Если да, окно закроется, как только
 дочерний процесс завершится. Обратите внимание, что установка его в yes означает,
 что любые фоновые процессы, все еще использующие терминал, могут завершиться
 автоматически, потому что их stdout/stderr/stdin больше не работают.
\e[32m close_on_child_death no\e[0m
";ES;fi;;
  3) S=M3;SC; if [[ $cur == enter ]];then R;echo -e "
 Разрешить другим программам управлять kitty.
 Если вы включите это, другие программы смогут управлять всеми аспектами kitty,
 включая отправку текста в окна kitty, открытие новых окон, закрытие окон,
 чтение содержимого окон и т. д. Обратите внимание, что это работает даже через
 ssh-соединения. Вы можете либо разрешить любой программе, работающей внутри kitty
 управлять им, выбрав yes, либо только программам, которые подключаются к сокету,
 указанному с помощью параметра командной строки kitty --listen-on, если вы
 используете значение socket-only. Последнее полезно, если вы хотите, чтобы
 программы, работающие на удаленном компьютере через ssh, не управляли kitty.
 Перезагрузка конфигурации не повлияет на настройки.
\e[32m allow_remote_control no\e[0m
";ES;fi;;
  4) S=M4;SC; if [[ $cur == enter ]];then R;echo -e "
 Скажите kitty слушать указанный сокет unix/tcp для подключений удаленного
 управления. Обратите внимание, что это будет применяться ко всем экземплярам
 kitty. Его можно переопределить с помощью флага командной строки
 kitty --listen-on. Эта опция принимает только сокеты UNIX, такие как unix:
 \${TEMP}/mykitty или (в Linux) unix:@mykitty. Переменные среды расширены.
 Если присутствует {kitty_pid}, то он заменяется PID процесса kitty,
 в противном случае PID процесса kitty добавляется к значению с дефисом.
 Этот параметр игнорируется, если только вы не установите параметр
 allow_remote_control для включения удаленного управления.
 См. помощь для kitty --listen-on для более подробной информации.
 Изменение этой опции путем перезагрузки конфига не поддерживается.
\e[32m listen_on none\e[0m
";ES;fi;;
  5) S=M5;SC; if [[ $cur == enter ]];then R;echo -e "
 Укажите переменные среды для установки во всех дочерних процессах.
 Обратите внимание, что переменные среды расширяются рекурсивно,
 поэтому, если вы используете:
 env MYVAR1=a
 env MYVAR2=\${MYVAR1}/\${HOME}/b
 Значением MYVAR2 будет a/<путь к домашнему каталогу>/b.
 Использование VAR= установит пустую строку,
 а использование только VAR удалит переменную из среды дочернего процесса.
";ES;fi;;
  6) S=M6;SC; if [[ $cur == enter ]];then R;echo -e "
 Путь к файлу python, который будет загружен для:
 https://sw.kovidgoyal.net/kitty/launch/#watchers.
 Можно указать более одного раза для загрузки нескольких наблюдателей.
 Наблюдатели будут добавлены к каждому kitty окну.
 Относительные пути разрешаются относительно каталога конфигурации kitty.
 Обратите внимание, что перезагрузка конфигурации повлияет только на окна,
 созданные после перезагрузки.
";ES;fi;;
  7) S=M7;SC; if [[ $cur == enter ]];then R;echo -e "
 Контролируйте, где kitty ищет программы для запуска. Порядок поиска по умолчанию:
 сначала ищите общесистемный PATH, затем: ~/.local/bin и ~/bin. Если все еще не
 найдено, пробуется PATH, определенный в оболочке входа в систему после поиска
 всех его файлов запуска. Наконец, если он присутствует, пробуется PATH в опции
 env. Эта опция позволяет вам добавлять или удалять пути из этого порядка поиска.
 Его можно указать несколько раз для нескольких путей.
 Простой путь будет добавлен к порядку поиска.
 Путь, начинающийся со знака +, будет добавлен к порядку поиска после ~/bin выше.
 Путь, начинающийся со знака -, будет удален из всего порядка поиска.
 Например:
 exe_search_path /some/prepended/path
 exe_search_path +/some/appended/path
 exe_search_path -/some/excluded/path
";ES;fi;;
  8) S=M8;SC; if [[ $cur == enter ]];then R;echo -e "
 Периодически проверяйте, доступно ли обновление для котенка. Если обновление
 найдено, отображается системное уведомление, информирующее вас о доступном
 обновлении. По умолчанию проверка выполняется каждые 24 часа, для отключения
 установлено значение ноль. Проверка обновлений выполняется только официальными
 бинарными сборками. Пакеты дистрибутива или исходные сборки не проверяют наличие
 обновлений. Изменение этой опции путем перезагрузки конфига не поддерживается.
\e[32m update_check_interval 24\e[0m
";ES;fi;;
  9) S=M9;SC; if [[ $cur == enter ]];then R;echo -e "
 Путь к файлу сеанса, который будет использоваться для всех экземпляров kitty.
 Можно переопределить с помощью параметра командной строки kitty --session
 для отдельных экземпляров. Видеть:
 https://sw.kovidgoyal.net/kitty/overview/#startup-sessions
 в документации по kitty для получения подробной информации.
 Обратите внимание, что относительные пути интерпретируются относительно каталога
 конфигурации kitty. Переменные среды в пути расширены. Изменение этой опции
 путем перезагрузки конфига не поддерживается.
\e[32m startup_session none\e[0m
";ES;fi;;
 10) S=M10;SC;if [[ $cur == enter ]];then R;echo -e "
 Разрешить работающим в kitty программам читать и писать из буфера обмена.
 Kонтролировать, какие именно действия разрешены.
 Набор возможных действий:
 write-clipboard
 read-clipboard
 write-primary
 read-primary
 read-clipboard-ask
 read-primary-ask.
 По умолчанию разрешается запись в буфер обмена и первичный выбор, а также
 запрашивается разрешение, когда программа пытается читать из буфера обмена.
 Обратите внимание, что отключение подтверждения чтения представляет собой
 угрозу безопасности, поскольку это означает, что любая программа, даже
 запущенная на удаленном сервере через SSH, может прочитать ваш буфер обмена.
 См. также: clipboard_max_size.
\e[32m clipboard_control\e[0m
\e[36m write-clipboard write-primary read-clipboard-ask read-primary-ask\e[0m
";ES;fi;;
 11) S=M11;SC;if [[ $cur == enter ]];then R;echo -e "
 Максимальный размер (в МБ) данных от запущенных в китти программ, которые будут
 сохраняться для записи в системный буфер обмена.
 Смотрите также clipboard_control.
 Нулевое значение означает, что ограничения по размеру не применяются.
\e[32m clipboard_max_size 64\e[0m
";ES;fi;;
 12) S=M12;SC;if [[ $cur == enter ]];then R;echo -e "
 Пароль, который можно указать котенку для передачи файлов, чтобы пропустить
 запрос подтверждения передачи. Это следует использовать только при инициировании
 передачи с доверенных компьютеров, через доверенные сети или зашифрованные тран-
спорты, поскольку это позволяет программам, работающим на удаленной машине, чи-
тать/записывать в локальную файловую систему без разрешения.
\e[32m file_transfer_confirmation_bypass\e[0m";ES;fi;;
 13) S=M13;SC;if [[ $cur == enter ]];then R;echo -e "
 Обрабатывать управляющие последовательности гиперссылок (OSC 8). Если отключено,
 управляющие последовательности OSC 8 игнорируются. В противном случае они стано-
 вятся интерактивными ссылками, по которым можно щелкнуть мышью
 или котенком-подсказкой: /kittens/hints
 Специальное значение \`\`ask\`\` означает, что kitty будет спрашивать перед
 открытием ссылки при нажатии.
\e[32m allow_hyperlinks yes\e[0m";ES;fi;;
 14) S=M14;SC;if [[ $cur == enter ]];then R;echo -e "
 Включите интеграцию оболочки в поддерживаемых оболочках.
 Это включает такие функции, как переход к предыдущим подсказкам, просмотр вывода
 предыдущей команды в пейджере и т. д. в поддерживаемых оболочках.
 Установите значение «отключено», чтобы полностью отключить интеграцию с оболочкой
 Подробнее см.: https://sw.kovidgoyal.net/kitty/shell-integration/.
\e[32m shell_integration enabled\e[0m";ES;fi;;
 15) S=M15;SC;if [[ $cur == enter ]];then R;echo -e "
 Значение переменной среды TERM, которое необходимо установить.
 Изменение этого может привести к поломке многих терминальных программ, меняйте
 его только в том случае, если вы знаете, что делаете, а не потому, что вы
 прочитали какой-то совет по переполнению стека, чтобы изменить его.
 Переменная TERM используется различными программами для получения информации
 о возможностях и поведении терминала. Если вы измените его, в зависимости от
 того, какие программы вы запускаете и насколько отличается терминал,
 на который вы его меняете, различные вещи, от нажатий клавиш до цветов
 и различных дополнительных функций, могут не работать.
 Изменение этого параметра путем перезагрузки конфигурации повлияет
 только на вновь созданные окна.
\e[32m term xterm-kitty\e[0m";ES;fi;;
#
 16) S=M16;SC;if [[ $cur == enter ]];then R;exit 0;fi;;
 esac;POS;done
