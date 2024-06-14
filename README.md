# immers-cloud-sd
простой способ завести и пользоваться automatic1111 на immers.cloud

## перед тем, как начать

установите ['PuTTY'](https://the.earth.li/~sgtatham/putty/latest/w64/putty-64bit-0.81-installer.msi)
> ваша архитектура не x86-64? ищите другие установщики [здесь](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)

## первоначальная установка

1) регистрируемся на [immers.cloud](https://immers.cloud/)

2) пополняем баланс на 200 рублей [здесь](https://immers.cloud/topup/topup/)
   
3) создаем новый облачный сервер [здесь](https://immers.cloud/vm/create/)

> для работы нам потребуется минимум 16 гб озу и 3080 в качестве видеоадаптера \
> чтобы продолжать пользоваться туториалом обязательно выберите образ ubuntu с предустановленным stable diffusion и тип инстанса local \
> для удобства можете повторить мою конфигурацию (52,72 рубля в час) \
> ![image](https://github.com/moveonwasd/immers-cloud-sd/assets/69754035/cd30ac91-6acf-4313-bf9c-14247bae3c36)

4) ожидайте статуса 'ACTIVE'. для моей конфигурации это заняло 6-7 минут
> ![image](https://github.com/moveonwasd/immers-cloud-sd/assets/69754035/d076d2c6-a587-4c7a-8fcc-0569ea2dcb65)

5) нам присвоился ip-адрес, и если по нему перейти, то мы уже сможем увидеть работающий sd
> важно: не нажимайте на ссылку, а скопируйте и вставьте её в адресную строку, так как гиперссылка открывается по протоколу ssh \
> ![image](https://github.com/moveonwasd/immers-cloud-sd/assets/69754035/6ca20462-9d30-49e3-b82a-46fe29984b3d) \
> ![image](https://github.com/moveonwasd/immers-cloud-sd/assets/69754035/b53dc001-4e02-40d9-87af-27a4e1d12a18)

6) заходим в [ключевые пары](https://immers.cloud/keypair/) и нажимаем на ту, которую создали при выборе сервера
> ![image](https://github.com/moveonwasd/immers-cloud-sd/assets/69754035/a45d00b3-ccbc-4e67-a1b0-ff30da073e30)

7) нажимаем на 'PPK' и скачиваем файл
 
8) открываем 'PuTTY' и вставляем ip-адрес нашего сервера в поле 'Host Name'
> ![image](https://github.com/moveonwasd/immers-cloud-sd/assets/69754035/788fc3a9-db13-4e20-a32b-bfd25e561e9e)

9) через меню слева переходим в 'Connection' - 'SSH' - 'Auth' - 'Credentials', нажимаем 'Browse' для 'Private key file for authentiation' и выбираем наш 'PPK' файл
> ![image](https://github.com/moveonwasd/immers-cloud-sd/assets/69754035/37356852-b8c4-4c16-9087-ea70fc300b37)

10) возвращаемся в 'Session', в поле под 'Saved Sessions' вводим любое удобное название и нажимаем 'Save'
> ![image](https://github.com/moveonwasd/immers-cloud-sd/assets/69754035/b332ed6a-58b2-464d-b36f-bbcbca194ef4)

11) двойным нажатием по нашему названию в списке открываем консоль, на всплывающем окне нажимаем 'Accept'
> ![image](https://github.com/moveonwasd/immers-cloud-sd/assets/69754035/cd724ee7-a716-49f1-8f4a-8bb2bebc1056)

12) консоль просит ввести логин, вводим стандартный, в нашем случае - `ubuntu` и жмём <Enter>
> ![image](https://github.com/moveonwasd/immers-cloud-sd/assets/69754035/7b69ecf2-4210-4fe2-a26a-0278c31455b1)

13) вводим `git init . -b main ; git remote add origin https://github.com/moveonwasd/immers-cloud-sd ; git pull origin main` и жмём \<Enter>
> ![image](https://github.com/moveonwasd/immers-cloud-sd/assets/69754035/85dc3949-399b-4149-973d-1f02a6d39634)

14) вводим `sudo bash setup.sh`, жмём \<Enter> и ждём конца настройки
> настройка может занимать от 3 до 10 минут \
> ![image](https://github.com/moveonwasd/immers-cloud-sd/assets/69754035/fcca7275-5a1c-4c3b-82a9-45dfda9f18a4)

15) закрываем консоль, со всплывающим окном соглашаемся
> ![image](https://github.com/moveonwasd/immers-cloud-sd/assets/69754035/21a77fe0-4907-4e94-8ced-c95fdf2fe86b)

16) возвращаемся на страницу с нашим облачным сервером и жмём '📌' рядом с ip-адресом, чтобы сделать его статическим
> ![image](https://github.com/moveonwasd/immers-cloud-sd/assets/69754035/4617e15f-4837-48e2-aafb-2e06d06a5a51)

17) перезапускаем сервер через 'Действия' - 'Reboot'
> ![image](https://github.com/moveonwasd/immers-cloud-sd/assets/69754035/a8f1fa4a-c35c-45e9-868d-2a5a81322dec)

18) после перезапуска проверяем, что всё работает
> ![image](https://github.com/moveonwasd/immers-cloud-sd/assets/69754035/68095c9c-e84a-4157-bf2d-316a24816cdc)

19) на этом моменте обязательно делаем снимок сервера через 'Действия' - 'Create Snapshot'
> это действие может занимать очень много времени (час), имейте терпение \
> ![image](https://github.com/moveonwasd/immers-cloud-sd/assets/69754035/5ea0919d-297e-4d18-bd37-919ad4510ea9)

20) наш снимок будет находиться [здесь](https://immers.cloud/snapshot/)
> ![image](https://github.com/moveonwasd/immers-cloud-sd/assets/69754035/0dd58d48-f0a2-4533-83f5-69afc610bff1)

21) теперь обязательно выключаем и удаляем сервер, чтобы не тратились деньги за простой
> так как выключенный сервер тарифицируется точно так же, как и включённый \
> ![image](https://github.com/moveonwasd/immers-cloud-sd/assets/69754035/26075818-b8db-47ac-b91f-c09729632503) \
> ![image](https://github.com/moveonwasd/immers-cloud-sd/assets/69754035/82006eec-710d-440d-9fc8-1ebad5f4967c)

теперь у нас есть снимок сервера, из которого мы можем его развернуть при необходимости не тратя 36 тысяч рублей в месяц \
единственное, за что придется платить - это 50 рублей в час за работу сервера и 100 рублей в месяц за хранение снимка

## использование

1) заходим в '[Снимки](https://immers.cloud/snapshot/)', нажимаем на ранее созданный нами, и затем на 'Создать виртуальную машину'
> ![image](https://github.com/moveonwasd/immers-cloud-sd/assets/69754035/b9d30775-78eb-4ad2-bd53-c9d0ee29a804)

2) если вылезает диалоговое окно с предложением восстановить конфигурацию, соглашаемся
> если нет, то выбираем всё как в пункте 3 первоначальной настройки \
> ![image](https://github.com/moveonwasd/immers-cloud-sd/assets/69754035/b747c424-42ef-4461-9d39-7f17d72f6d53)

3) для удобства выбираем зарезервированный нами статический ip и ключевую пару
> ![image](https://github.com/moveonwasd/immers-cloud-sd/assets/69754035/fd8de11e-c33e-4fa7-b939-6f43b0eb8932)

4) если собираемся пользоваться всего лишь час или до выключения сервера, можем это настроить в 'Расширенные настройки'
> ![image](https://github.com/moveonwasd/immers-cloud-sd/assets/69754035/a901d8d4-d8d4-4fa2-91b7-dc90b4e154fa)

5) ждём статуса 'ACTIVE'
> это займёт 7-8 минут \
> ![image](https://github.com/moveonwasd/immers-cloud-sd/assets/69754035/8bd5b007-486f-4ce8-b548-5c0d5fe29461)

6) переходим по ip-адрес и убеждаемся, что всё работает
> ![image](https://github.com/moveonwasd/immers-cloud-sd/assets/69754035/8c5bc841-2e2b-4136-870a-61b0f1cec5b4)

7) если не включили автоматическое удаление, то, после использования сервера, обязательно его выключаем и удаляем
> ![image](https://github.com/moveonwasd/immers-cloud-sd/assets/69754035/a47d795f-9b47-4930-886f-a385f890d0e0) \
> ![image](https://github.com/moveonwasd/immers-cloud-sd/assets/69754035/dcf13a78-df10-47ef-9fc0-42da6a532fb9)







