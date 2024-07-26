*** Variables ***
${BROWSER}        Chrome
${area_code}      821
${snap_config}      https://snaptest-configurator.bayarind.id/tools/generate-asymmetric
${email}    snapconfigurator@bayarind.id
${pass}    Rahasia123$
${private_key}    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

${HOTEL_SANTIKA_BANDUNG}    https://web.santikadev.com/hotel?hotelId=66&checkInDate=2024-07-15&duration=1&rooms=1&specialRateCode
${HOTEL_SANTIKA_BANGKA}    https://web.santikadev.com/hotel?hotelId=67&checkInDate=2024-07-22&duration=1&rooms=1&specialRateCode
${HOTEL_SANTIKA_BANYUWANGI}    https://web.santikadev.com/hotel?hotelId=65&checkInDate=2024-07-22&duration=1&rooms=1&specialRateCode
${HOTEL_SANTIKA_BENGKULU}    https://web.santikadev.com/hotel?hotelId=68&checkInDate=2024-07-22&duration=1&rooms=1&specialRateCode
${Hotel_Santika_Premiere_ICE_BSD_City}    https://web.santikadev.com/hotel?hotelId=93&checkInDate=2024-07-22&duration=1&rooms=1&specialRateCode
${HOTEL_SANTIKA_CIKARANG}    https://web.santikadev.com/hotel?hotelId=71&checkInDate=2024-07-22&duration=1&rooms=1&specialRateCode
${HOTEL_SANTIKA_CIREBON}    https://web.santikadev.com/hotel?hotelId=72&checkInDate=2024-07-23&duration=1&rooms=1&specialRateCode
${HOTEL_SANTIKA_DEPOK}    https://web.santikadev.com/hotel?hotelId=73&checkInDate=2024-07-24&duration=1&rooms=1&specialRateCode
${Hotel_Santika_Kelapa_Gading_Jakarta}    https://web.santikadev.com/hotel?hotelId=76&checkInDate=2024-07-24&duration=1&rooms=1&specialRateCode
${HOTEL_SANTIKA_KUTA}    https://web.santikadev.com/hotel?hotelId=77&checkInDate=2024-07-24&duration=1&rooms=1&specialRateCode
${HOTEL_SANTIKA_MAKASSAR}    https://web.santikadev.com/hotel?hotelId=79&checkInDate=2024-07-24&duration=1&rooms=1&specialRateCode

${Hotel_Santika_Mataram_Lombok}    https://web.santikadev.com/hotel?hotelId=80&checkInDate=2024-07-24&duration=1&rooms=1&specialRateCode
${HOTEL_SANTIKA_PALU}    https://web.santikadev.com/hotel?hotelId=82&checkInDate=2024-07-24&duration=1&rooms=1&specialRateCode
${Hotel_Santika_Pandegiling_Surabaya}    https://web.santikadev.com/hotel?hotelId=83&checkInDate=2024-07-24&duration=1&rooms=1&specialRateCode
${HOTEL_SANTIKA_PEKALONGAN}    https://web.santikadev.com/hotel?hotelId=84&checkInDate=2024-07-24&duration=1&rooms=1&specialRateCode
${HOTEL_SANTIKA_SEMINYAK}    https://web.santikadev.com/hotel?hotelId=101&checkInDate=2024-07-24&duration=1&rooms=1&specialRateCode

${Hotel_Santika_Siligita_Nusa_Dua_Bali}    https://web.santikadev.com/hotel?hotelId=102&checkInDate=2024-07-24&duration=1&rooms=1&specialRateCode
${HOTEL_SANTIKA_TASIKMALAYA}    https://web.santikadev.com/hotel?hotelId=105&checkInDate=2024-07-25&duration=1&rooms=1&specialRateCode
${Hotel_Santika_Mega_City_Bekasi}    https://web.santikadev.com/hotel?hotelId=81&checkInDate=2024-07-25&duration=1&rooms=1&specialRateCode
${HOTEL_SANTIKA_RADIAL_PALEMBANG}    https://web.santikadev.com/hotel?hotelId=100&checkInDate=2024-07-26&duration=1&rooms=1&specialRateCode
${Hotel_Santika_Luwuk_Sulawesi_Tengah}    https://web.santikadev.com/hotel?hotelId=78&checkInDate=2024-07-26&duration=1&rooms=1&specialRateCode

${Hotel_Santika_Sukabumi_Jawa_Barat}    https://web.santikadev.com/hotel?hotelId=103&checkInDate=2024-07-26&duration=1&rooms=1&specialRateCode
${HOTEL_SANTIKA_GARUT}    https://web.santikadev.com/hotel?hotelId=74&checkInDate=2024-07-26&duration=1&rooms=1&specialRateCode
${Hotel_Santika_Premiere_Beach_Resort_Belitung}    https://web.santikadev.com/hotel?hotelId=88&checkInDate=2024-07-26&duration=1&rooms=1&specialRateCode
${Hotel_Santika_Premiere_Bandara_Palembang}    https://web.santikadev.com/hotel?hotelId=86&checkInDate=2024-07-26&duration=1&rooms=1&specialRateCode
${Hotel_Santika_Pasir_Koja}    https://web.santikadev.com/hotel?hotelId=123&checkInDate=2024-07-26&duration=1&rooms=1&specialRateCode

${HOTEL_SANTIKA_GRESIK}    https://web.santikadev.com/hotel?hotelId=111&checkInDate=2024-07-29&duration=1&rooms=1&specialRateCode
${Hotel_Santika_Bukittinggi}    https://web.santikadev.com/hotel?hotelId=139&checkInDate=2024-07-29&duration=1&rooms=1&specialRateCode
${Hotel_Santika_Premiere_Padang}    https://web.santikadev.com/hotel?hotelId=135&checkInDate=2024-07-29&duration=1&rooms=1&specialRateCode
${Hotel_Santika_Premiere_Bintaro}    https://web.santikadev.com/hotel?hotelId=89&checkInDate=2024-07-29&duration=1&rooms=1&specialRateCode
${Hotel_Santika_Premiere_Dyandra_Medan}    https://web.santikadev.com/hotel?hotelId=90&checkInDate=2024-07-29&duration=1&rooms=1&specialRateCode