---
utid: 1000-01-02
chapter: 01
chaptername: فصل اول: پیش به سوی صفر
part: 02
title: کامپوزر و مدیریت بسته‌ها
_index: composer
---



در [مقدمه](/laravel-0-to-60/chapter00/lesson01/preface/) گفتیم و از نام کتاب هم پیداست که فرآیند آموزش از نقطه‌ی صفر شروع می‌شود و لازم نیست چیزی درباره‌ی لاراول بدانید.

اما به پیش‌نیازهایی هم اشاره کردیم که قرار شد در هر کدام از درس‌های فصل یک کتاب، یکی از آن‌ها را بشکافیم.

این درس، به معرفی [کامپوزر](https://getcomposer.org/) و نقش آن به عنوان سیستم مدیریت بسته‌های پی‌اچ‌پی اختصاص دارد.

##### اگر با موضوع این درس، یا هر یک از درس‌های فصل یکم کتاب آشنا هستید، بهتر است وقت خود را تلف نکنید و بدون مطالعه، از آن عبور کنید. فصل‌های بعدی به مطالب این فصل وابسته نیستند.



# خود را تکرار نکنید

برنامه‌نویسان پی‌اچ‌پی، در روزگاری نه‌چندان دور، برای هر پروژه‌ای که می‌نوشتند یک بار چرخ را از نو اختراع می‌کردند. آن‌ها آنچه که لازم داشتند را از این سو و آن سو گرد هم می‌آوردند و در پوشه‌ای کپی می‌کردند و بعد بنای خود را بر آن استوار می‌ساختند.

از آنجا که فرآیند آماده‌سازی نقطه‌ی صفر پروژه‌ها کاری بسیار دردناک و وقت‌گیر است، بعضی‌ها پوشه‌هایی از پیش آماده شده به عنوان آغاز پروژه‌های خود می‌ساختند که از آن پس مجبور نباشند ابزارها را جمع‌آوری کنند.

اما به این سادگی‌ها نبوده و نیست.

یکی دو روز وقت می‌گذاریم و ابزارهایی که خودمان ساخته‌ایم و آن‌ها که دیگران ساخته‌اند و دانلود کرده‌ایم را گرد هم می‌آوریم و پوشه‌ای می‌سازیم و بعد، در حالی که با افتخار به کارمان نگاه می‌کنیم و به خود می‌گوییم که برای پروژه‌ی بعدی نیازی به این همه کار نیست، یک کپی دست‌نخورده از پوشه را برای بعدها کنار می‌گذاریم.

دو ماه بعد، هنگامی که پروژه‌ی جدیدی را کلید می‌زنیم، با خوشحالی سراغ پوشه‌ی آماده‌ی خودمان می‌رویم و یک کپی از آن می‌گیریم، اما درست وقتی که می‌خواهیم شروع کنیم می‌بینیم که ای دل غافل:

- بعضی از ابزارهایی که خودمان ساخته بودیم، در طول پروژه‌ی قبلی بهتر شده‌اند و ارتقاء یافته‌اند و آنچه که دو ماه پیش در این پوشه گذاشته بودیم، به درد نمی‌خورد و باید نسخه‌ی تازه‌ای از کدهای پروژه‌ی قبلی کپی کنیم.
- در این پروژه قرار نیست چیزی را برای کسی پیامک کنیم و بهتر است ابزارهای مرتبط با آن را از پوشه‌ی جدیدمان حذف کنیم که برنامه سنگین نشود.
- در این پروژه، بر خلاف قبلی به API نیاز داریم و آخرین پروژه‌ای که با API سروکار داشت مال شش ماه پیش بود و باید آخرین کدها را از آن پروژه بیاوریم.
- دیگران هم در این دو ماه بی‌کار نبوده‌اند و ابزارهای عمومی‌شان را به‌روزرسانی کرده‌اند و حالا باید برویم و آن‌ها را هم از نو دانلود کنیم و جایگزین نسخه‌های قبلی کنیم.
- یکی از ابزارهای عمومی که آپدیت شده، با یکی دیگر از ابزارهایی که ما نوشته‌ایم و حوصله نداریم بازسازی کنیم، سازگار نیست و باید یکی از نسخه‌های قبلی آن را که هنوز سازگار است ولی از مرتبه‌ی قبلی جدیدتر باشد بیابیم و در فایل‌هایمان بگذاریم.

بعد از سه روز که این کارها را کردیم، لبخند می‌زنیم و می‌گوییم که در عوض پوشه‌ام بهتر شده و در پروژه‌ی بعدی دیگر دو روز وقت نمی‌گذارم.

دو ماه دیگر این پروژه هم تمام می‌شود و کار بعدی از راه می‌رسد و روز از نو، روزی از نو!

اجازه بدهید خاطر شما را با یادآوری بلاهایی که در حین نوشتن پروژه‌ها، یا بدتر از آن، هنگام توسعه‌ی آن‌ها یک سال پس از نسخه‌ی اولیه رخ می‌داد نیازارم.

# بسته‌های برنامه‌نویسی

واقعیت آن است برنامه‌نویسان پی‌اچ‌پی موجودات نگون‌بختی بودند که هر بار همه‌ی این کارها را می‌کردند و روزها که به خواب می‌رفتند، دنیایی را تصور می‌کردند که بسته‌های برنامه‌نویسی همه در یک جا باشند و خودبه‌خود آپدیت شوند. این بخت سیاه وقتی کامل می‌شد که طعنه‌ی برنامه‌نویسان زبان‌های دیگر را می‌دیدند و چیزی نمی‌توانستند بگویند. (شاید برای همین بوده که شب‌ها کار می‌کردند و روزها می‌خوابیدند.)

## مدیریت گلابی‌وار بسته‌ها

کمی پیش از پایان قرن بیستم بود که سر و کله‌ی ابزاری به نام PEAR پیدا شد. این عنوان، که در فارسی به معنای «گلابی» است، سرواژه‌ی عبارتی طولانی است به معنی «مخزن افزونه‌ها و برنامه‌های پی‌اچ‌پی» (PHP Extension and Application Repository).

![PEAR](/laravel-0-to-60/images/pear.png)

«گلابی» می‌توانست بسته‌ها را از مخزنی واحد دانلود و نصب کند و همچنین، مراقب وابستگی‌های آن‌ها نیز باشد تا اگر یک بسته به بسته‌ی دیگری نیاز دارد، آن را هم دریافت و نصب نماید. 

«گلابی»، که نوید روزهای خوبی را به دنیای پی‌اچ‌پی می‌داد، خیلی زود به سرطانی تبدیل شد که هرچه می‌گذشت حال و روز وخیم‌تری به خود می‌گرفت. اول آن که خیلی‌ها رغبت نمی‌کردند برنامه‌های خود را در مخازن PEAR آپدیت کنند و آپدیت نگاه دارند و بدتر از آن، «گلابی» بسته‌ها را در تمام سیستم شما نصب می‌کرد و نمی‌توانست خود را محدود به یک پروژه کند. یعنی اگر روی دو پروژه‌ی هم‌زمان کار می‌کردید و یکی از پروژه‌ها به روایتی قدیمی‌تر از یک بسته نیاز داشت، کارتان ساخته بود!

مشکل است باور کنیم که کسی یا کسانی به کمک این ابزار گرهی از مشکلات خود گشوده باشند. PEAR هنوز وجود دارد و هنوز نفس می‌کشد، اما هیچ کس نمی‌داند چرا.

# کامپوزر وارد می‌شود

سیزده سال پس از آغاز تجربه‌ی ناموفق PEAR، کامپوزر با الهام از آنچه `npm` در دنیای `node.js` و `Bundler` در دنیای `Ruby` انجام داده بود، پا به عرصه‌ی وجود گذاشت و به‌سرعت مشهور شد و مورد قبول بخش بزرگی از جامعه‌ی برنامه‌نویسان پی‌اچ‌پی قرار گرفت و با حمایت بیش از ده فریمورک معتبر و زنده‌ی این زبان، عملاً به یک استاندارد تبدیل شد.

![Composer](/laravel-0-to-60/images/composer.png)

کامپوزر در تمام سیستم نصب می‌شود، اما پکیج‌ها را هم به صورت پروژه‌ای و هم به صورت سراسری مدیریت می‌کند. کامپوزر می‌تواند بسته‌ها را کش کرده و از دانلود مکرر آن جلوگیری نماید و از همه مهم‌تر آن که پایانی بر کابوس روزانه‌ی توسعه‌دهندگان پی‌اچ‌پی باشد.

واقعیت آن است که اغلب آنچه از شلختگی و ناکارآمدی پی‌اچ‌پی می‌شنوید، به نسخه‌های پیش از ۵/۵ پی‌اچ‌پی و دنیای وردپرس و جوملا بازمی‌گردد و روزگاری که هنوز کامپوزر و مدیریت کارآمد بسته‌ها در آن جایی نداشت.

## نصب کامپوزر

کامپوزر، در خط فرمان سیستم‌عامل‌های یونیکس، گنو/لینوکس و مک، به سادگی اجرای دو دستور نصب می‌شود.

```bash
$ curl -s https://getcomposer.org/installer | php
$ sudo mv composer.phar /usr/local/bin/composer
```

نگران سیستم عامل ویندوز نباشید. فایل قابل نصب کامپوزر برای این سیستم عامل نیز مهیا است. ([این‌جا](https://getcomposer.org/doc/00-intro.md))

## فراخوانی کامپوزر

پس از نصب کامپوزر، از طریق خط فرمان می‌توانید به آن دسترسی داشته باشید و خبر خوب آن است که این دسترسی، در تمام سیستم‌عامل‌های متداول، یکسان است.

```bash
$ composer
```

# استفاده از کامپوزر

مهم‌ترین مزیت کامپوزر آن است که می‌تواند بسته‌ها را در هر پروژه به صورت مستقل مدیریت کند. کامپوزر بسته‌ها را در پوشه‌ای به نام vendor که در ریشه‌ی پروژه‌ی شما جای می‌گیرد قرار می‌دهد و الگوی کار خود را از فایلی به نام `composer.json` دریافت می‌کند.

برای شروع، کافی‌ست فایلی با نامی که گفته شد، در هر پوشه‌ای که دوست داشتید درست کنید و با استفاده از الگوی `json`، بسته‌های مورد نیازتان را مشخص کنید.

```json
{
    "require": {
        "laravel/framework": "5.5.*",
        "albertcht/invisible-recaptcha": ">=1.8"
    }
}
```

با استفاده از شیء `require` بسته‌هایی که لازم داریم را یکی‌یکی معرفی می‌کنیم. همان طور که می‌بینید، در هر سطر نام بسته‌ی مورد نظر و مختصات نسخه‌ی مورد نیاز را آورده‌ایم.

## نام بسته‌ها

نام بسته‌ها از دو بخش تشکیل شده است. بخش اول تولیدکننده‌ی بسته است و بخش دوم، نام بسته. فهرست بسته‌های قابل نصب را نیز می‌توانید از [Packagist](https://packagist.org/) بیابید.

## کنترل نسخه

در مثال بالا، لاراول را با نسخه‌های فرعی ۵/۵ خواسته‌ایم. یعنی فریمورک لاراول به طور خودکار از نسخه‌ی ۵/۵/۱ به ۵/۵/۲ .و بعد به ۵/۵/۳ و تا ۵/۵/۹۹ و بلکه بالاتر آپدیت می‌شود، ولی وارد ۵/۶ نمی‌شود.

بعید است با نگاهی به کد مثال، حدس نزنید که بسته‌ی  `invisible-recaptcha` را با چه نسخه‌ای می‌خواهیم.

الگوی کنترل نسخه‌ها در کامپوزر بسیار متنوع است. فهرست کامل آن را در [مستندات کامپوزر](https://getcomposer.org/doc/articles/versions.md) بجویید.

## محیط‌های مختلف

ممکن است بسته‌هایی داشته باشید که فقط در فاز توسعه و راه‌اندازی به کار بیایند و وقتی سایت روی سرور اصلی قرار دارد، نیازی به آن‌ها نباشد. کافی‌ست این‌گونه بسته‌ها را به جای آن که در شیء `require` قرار دهید، در `require-dev` معرفی کنید.

```json
{
    "require": {
        "laravel/framework": "5.5.*",
        "albertcht/invisible-recaptcha": ">=1.8"
    },
    "require-dev": {
        "barryvdh/laravel-debugbar": "^2.4"
    }
}
```

## نصب بسته‌ها

حالا دیگر کافی‌ست با استفاده از یک دستور ساده‌ی خط فرمان، از کامپوزر بخواهید فهرست شما را مرور کند و آنچه لازم است را دانلود نماید.

```bash
$ composer install
```

کامپوزر، پوشه‌ای به نام `vendor` می‌سازد و هر آن‌چه خواسته‌اید را به همراه وابستگی‌هایشان در آن می‌ریزد تا در پروژه‌هایتان استفاده کنید.

همه‌ی بسته‌ها، چه آن‌ها که در  `require` قرار داده شده‌اند و چه آن‌ها که در `require-dev` هستند، به صورت پیش‌فرض نصب می‌شوند. اما اگر نیازی به آن‌ها که مناسب فاز توسعه هستند ندارید، می‌توانید این موضوع را با یک سوییچ یادآور شوید.

```bash
$ composer instal --no-dev
```

واضح است که بسته‌ها را در حین کار روی پروژه‌ نیز می‌توانید آپدیت کنید.

```bash
$ composer update
```

و از همه جذاب‌تر آن که اگر پروژه‌ی خود را جایی آپلود کنید که دسترسی `ssh` به شما می‌دهد، وابستگی‌هایتان را در زمان بهره‌برداری از پروژه نیز می‌توانید همواره به‌روز نگهداری کنید.

```bash
$ composer update --no-dev
```

##### رسم است که پوشه‌ی vendor را از دسترس گیت دور نگاه می‌دارند (ایگنور می‌کنند) تا بتوانند میان محیط‌های توسعه و بهره‌برداری، با سهولت هرچه تمام‌تر تفاوت قائل شوند.

## فراخوانی خودکار فایل‌ها

یکی از هنرهای کامپوزر آن است که می‌توانید بسته‌ها و کتابخانه‌هایی را جهت استفاده‌ی مداوم، دم دست نگاه دارید. برای این کار، می‌توانید هنگام تعریف فایل `composer.json`، از شیء ‍‍`autoload‍‍` استفاده نمایید.

```json
{
  "autoload-dev": {
    "psr-4": {
      "Apollo\\": "apollo/"
    }
  },
}
```

این بار نیز می‌توانید به همان شیوه‌ی قبل، میان محیط توسعه و بهره‌برداری خود تفاوت قائل شوید.

 کامپوزر هنگام نصب و آپدیت، فایلی به نام `autoloads.php` می‌سازد و آنچه را سفارش داده‌اید در آن `include` (در مفهوم پی‌اچ‌پی آن) می‌کند و شما می‌توانید با دخیل کردن آن در پروژه، نیم‌اسپیس‌ها یا کلاس‌های مورد نیاز خود را سریع‌تر فراخوانی کنید.

نگران این چیزها نباشید. لاراول ترتیب کار را می‌دهد. این اندازه بدانید که فایل `autoload.php` خود را می‌توانید هر زمان که مایل بودید، از نو بسازید.

```bash
$ composer dump-autoload
```

# نگران نباشید

مستندات کامپوزر مفصل هستند و در این درس نمی‌گنجند و قرار هم نبود همه‌ی آن‌ها را بازگو کنیم. حتی قرار نبود مهم‌هایش را بگوییم. همین اندازه که با مفهوم بسته‌ها و کامپوزر، به عنوان ابزار مدیریت بسته‌ها در پی‌اچ‌پی آشنا شده باشید، برای این درس کافی است.

زیاد هم نگرانش نباشید. لاراول بیشتر کارها را انجام می‌دهد و حتی اگر ندانید کامپوزر چطور کار می‌کند، می‌توانید پروژه‌های خوبی را با لاراول خلق کنید.
