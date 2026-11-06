# COET Akola Chatbot — Deployment Guide
## College of Engineering and Technology, Akola

---

## 🖥️ LOCAL SETUP (XAMPP)

1. Copy `coet_production` folder to:
   `C:/xampp/htdocs/coet_production`

2. Open phpMyAdmin: http://localhost/phpmyadmin
   - Create database: `college_chatbot`
   - Import: `database/college_chatbot.sql`

3. Open browser:
   `http://localhost/coet_production/frontend/index.html`

---

## 🌐 LIVE SERVER DEPLOYMENT

### Step 1 — Upload Files
Upload entire `coet_production` folder to your hosting via FTP/cPanel

### Step 2 — Database Setup
- Create MySQL database in cPanel
- Import `database/college_chatbot.sql`

### Step 3 — Configure .env
Edit `backend/.env`:
```
DB_HOST=localhost
DB_USER=your_cpanel_db_username
DB_PASS=your_db_password
DB_NAME=your_db_name
GEMINI_API_KEY=your_gemini_api_key_here
SITE_URL=https://yourdomain.com
ALLOWED_ORIGIN=https://yourdomain.com
```

### Step 4 — SSL Certificate
Enable free SSL in cPanel (Let's Encrypt)

### Step 5 — Test
Visit: `https://yourdomain.com/frontend/index.html`

---

## 📁 FILE STRUCTURE
```
coet_production/
├── .htaccess               ← Security + URL rules
├── backend/
│   ├── .env                ← Config (DB + API keys) — KEEP PRIVATE
│   ├── .htaccess           ← Protects .env file
│   ├── chat.php            ← API endpoint (production ready)
│   ├── chatmodel.php       ← AI matching engine
│   └── db.php              ← Database connection
├── frontend/
│   ├── index.html          ← Main page
│   ├── script.js           ← Chatbot logic + voice + face detection
│   └── style.css           ← Styling + animations
├── database/
│   └── college_chatbot.sql ← Full database with 50+ keywords
└── images/ + videos/
```

---

## ✅ FEATURES
- Smart greeting with face/age detection
- Text-to-Speech voice (soft & polite)
- Animated bot avatar with expressions
- Visitor counter
- Voice input (mic) with live transcription
- 6-layer AI answer system
- Gemini AI fallback
- 50+ keywords (English + Hindi + Marathi)
- Rate limiting (30 req/min)
- Security headers
- Production-ready error handling

---

## 🔧 TROUBLESHOOTING

| Problem | Solution |
|---------|----------|
| Database error | Check .env DB credentials |
| AI not working | Check GEMINI_API_KEY in .env |
| CORS error | Update ALLOWED_ORIGIN in .env |
| Camera not working | Use HTTPS (SSL required) |
| Voice not working | Use Chrome browser |

---

## 📞 SUPPORT
College: COET Akola | Phone: 9960590202
