//
//  File.swift
//  
//
//  Created by MOBILE on 19/07/24.
//

import Foundation

class LocalizationManager {
    static let shared = LocalizationManager()
    
    private var localizationData: [String: [String: String]] = [:]
    
    private init() {
        loadLocalizationData()
    }
    
   
    
    func localizedString(forKey key: String) -> String {
        return localizationData[iPassSDKDataManager.shared.deviceCurrentLangauge]?[key] ?? key
    }
  //  LocalizationManager.shared.localizedString(forKey: "hello")
    private func loadLocalizationData() {
        localizationData = [
            "en": [
                "limit_over": "you have reached your transaction limit or you dont have access for transaction",
                "start_now": "Start Now",
                "downloading_database": "Downloading database",
                "user_login_issue": "User Login Issue",
                "social_media_email": "Social media email is requried",
                "phone_number_requried": "Phone number is requried",
                "email_format": "Social media email format is not correct",
                "session_error": "Error in creating session",
                "document_scanning_error": "Document Scanning Error",
                "nfc_issue": "Something went wrong with NFC.",
                "data_processing_error": "Data processing error",
                "internet_connection_error": "Internet Connection not found",
                "invalid_workflowid": "Work flow id is not valid"
            ],
            "ar": [
                "limit_over": "لقد وصلت إلى حد المعاملات الخاص بك أو ليس لديك حق الوصول للمعاملات",
                "start_now": "ابدأ الآن",
                "downloading_database": "جاري تحميل قاعدة البيانات",
                "user_login_issue": "مشكلة في تسجيل الدخول",
                "social_media_email": "مطلوب بريد الكتروني",
                "phone_number_requried": "مطلوب رقم الهاتف",
                "email_format": "البريد الالكتروني غير صحيح",
                "session_error": "خطأ في إنشاء الجلسة",
                "document_scanning_error": "خطأ في مسح الوثيقة",
                "nfc_issue": "حدث خطأ في NFC",
                "data_processing_error": "خطأ في معالجة البيانات",
                "internet_connection_error": "لم يتم العثور على اتصال بالإنترنت",
                "invalid_workflowid": "معرف تدفق العمل غير صالح"
            ],
            "fr": [
                "limit_over": "vous avez atteint votre limite de transaction ou vous n'avez pas accès à la transaction",
                "start_now": "Commencez maintenant",
                "downloading_database": "Téléchargement de la base de données",
                "user_login_issue": "Problème de connexion utilisateur",
                "social_media_email": "Email de réseau social est requis",
                "phone_number_requried": "Numéro de téléphone est requis",
                "email_format": "Format de l'email de réseau social incorrect",
                "session_error": "Erreur de création de session",
                "document_scanning_error": "Erreur de numérisation de document",
                "nfc_issue": "Une erreur est survenue avec NFC",
                "data_processing_error": "Erreur de traitement des données",
                "internet_connection_error": "Connexion Internet non trouvée",
                "invalid_workflowid": "L'identifiant du flux de travail n'est pas valide"
            ],
            "es": [
                "limit_over": "has alcanzado tu límite de transacción o no tienes acceso para transacciones",
                "start_now": "Comienza ahora",
                "downloading_database": "Descargando base de datos",
                "user_login_issue": "Problema de inicio de sesión",
                "social_media_email": "Correo de redes sociales es requerido",
                "phone_number_requried": "Número de teléfono es requerido",
                "email_format": "Formato de correo de redes sociales incorrecto",
                "session_error": "Error al crear la sesión",
                "document_scanning_error": "Error al escanear el documento",
                "nfc_issue": "Algo salió mal con NFC",
                "data_processing_error": "Error en el procesamiento de datos",
                "internet_connection_error": "No se encontró conexión a Internet",
                "invalid_workflowid": "La identificación del flujo de trabajo no es válida"
            ],
            "tr": [
                "limit_over": "işlem limitinize ulaştınız veya işlem için erişiminiz yok",
                "start_now": "Şimdi Başla",
                "downloading_database": "Veritabanı indiriliyor",
                "user_login_issue": "Kullanıcı Giriş Sorunu",
                "social_media_email": "Sosyal medya e-postası gereklidir",
                "phone_number_requried": "Telefon numarası gereklidir",
                "email_format": "Sosyal medya e-posta formatı doğru değil",
                "session_error": "Oturum oluşturma hatası",
                "document_scanning_error": "Belge Tarama Hatası",
                "nfc_issue": "NFC ile ilgili bir sorun oluştu.",
                "data_processing_error": "Veri işleme hatası",
                "internet_connection_error": "İnternet bağlantısı bulunamadı",
                "invalid_workflowid": "İş akışı kimliği geçerli değil"
            ],
            "ur": [
                "limit_over": "آپ نے اپنے ٹرانزیکشن حد کو پہنچ گئے ہیں یا آپ کے پاس ٹرانزیکشن کی رسائی نہیں ہے",
                "start_now": "ابھی شروع کریں",
                "downloading_database": "ڈیٹا بیس ڈاؤن لوڈ ہو رہا ہے",
                "user_login_issue": "صارف لاگ ان مسئلہ",
                "social_media_email": "سوشل میڈیا ای میل درکار ہے",
                "phone_number_requried": "فون نمبر درکار ہے",
                "email_format": "سوشل میڈیا ای میل کا فارم درست نہیں ہے",
                "session_error": "سیشن بنانے میں خرابی",
                "document_scanning_error": "دستاویز اسکین کرنے میں خرابی",
                "nfc_issue": "NFC کے ساتھ کچھ غلط ہو گیا",
                "data_processing_error": "ڈیٹا پروسیسنگ میں خرابی",
                "internet_connection_error": "انٹرنیٹ کنکشن نہیں ملا",
                "invalid_workflowid": "ورک فلو آئی ڈی درست نہیں ہے۔"
            ],
            "de": [
                "limit_over": "Sie haben Ihr Transaktionslimit erreicht oder Sie haben keinen Zugriff auf Transaktionen",
                "start_now": "Jetzt starten",
                "downloading_database": "Datenbank wird heruntergeladen",
                "user_login_issue": "Benutzeranmeldeproblem",
                "social_media_email": "Social-Media-E-Mail ist erforderlich",
                "phone_number_requried": "Telefonnummer ist erforderlich",
                "email_format": "Social-Media-E-Mail-Format ist nicht korrekt",
                "session_error": "Fehler beim Erstellen der Sitzung",
                "document_scanning_error": "Fehler beim Dokumentenscan",
                "nfc_issue": "Etwas ist mit NFC schiefgelaufen",
                "data_processing_error": "Datenverarbeitungsfehler",
                "internet_connection_error": "Internetverbindung nicht gefunden",
                "invalid_workflowid": "Die Workflow-ID ist ungültig"
            ],
            "ku": [
                "limit_over": "گەیشتووی سنووری مامەڵەکەت یان تۆ دەسەڵاتی مامەڵە نیە",
                "start_now": "ئێستا دەست پێبکە",
                "downloading_database": "داتابەیس داکرێتەوە",
                "user_login_issue": "کێشەی چوونەژورەوە",
                "social_media_email": "ئیمەیڵی کۆمەڵایەتی پێویستە",
                "phone_number_requried": "ژمارەی تەلەفۆن پێویستە",
                "email_format": "فۆرماتى ئیمەیڵی کۆمەڵایەتی هەڵەیە",
                "session_error": "هەڵە لە دروستکردنی سێشەن",
                "document_scanning_error": "هەڵە لە سکانکردنی بەڵگەنامە",
                "nfc_issue": "هەڵەیەک ڕوویدا لەگەڵ NFC",
                "data_processing_error": "هەڵە لە پڕۆسەکردنی زانیاری",
                "internet_connection_error": "هەڵەیەک ڕوویدا لەگەڵ بەرزەخ",
                "invalid_workflowid": "نەسنامەیا هێریکینا خەباتە نە دەرباسدار ئی"
            ],
            // Add more languages and strings as needed
        ]
    }
}

