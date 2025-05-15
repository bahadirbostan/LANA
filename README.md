# LANA
**C Tabanlı Özel Programlama Dili**

---

## 🔧 Geliştirici Notu
**LANA**, C dili tabanlı bir lexer-parser altyapısı kullanarak geliştirilmiş özel bir programlama dilidir. Flex (Lex) ve Bison (Yacc) ile yazılmıştır.

---

## 🖥️ Özellikler

- Özel sözdizimi (`yazdir`, `fonk`, `eger`, `dongu` vb.)
- Temel matematiksel işlemler
- Koşullu ifadeler
- Döngüler
- Çizim komutları (örnek: `daire_ciz`, `cizgi_ciz`)
- Tuş kontrolü desteği (örnek: `tus_basildi TUS_YUKARI ise ...`)

---

## 🪟 Windows Üzerinden Kurulum

### 1️⃣ MSYS2 Kurulumu
MSYS2, Windows üzerinde Linux benzeri bir geliştirme ortamı sunar.

1. [MSYS2 İndir](https://www.msys2.org/)  
2. Kurulumu tamamladıktan sonra MSYS2 terminalini açın.

### 2️⃣ Gerekli Paketleri Yükleyin

```bash
pacman -Syu           # Sistemi güncelleyin
pacman -S base-devel  # make, gcc gibi araçlar
pacman -S flex bison  # Flex ve Bison

```toRUN
MSYS2 UCRT64'ü çalıştırınız.
    -> flexer flexer.l
    -> bison -d parser.y
    -> gcc -o lana parser.tab.c lex.yy.c main.c 
    -> ./lana < {dosyaniz..'ornek.kis'}