-- ============================================================
--  COLLEGE OF ENGINEERING AND TECHNOLOGY, AKOLA
--  COMPLETE CHATBOT DATABASE - UPDATED
-- ============================================================

CREATE DATABASE IF NOT EXISTS college_chatbot CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE college_chatbot;

DROP TABLE IF EXISTS chatbot;

CREATE TABLE chatbot (
    id INT AUTO_INCREMENT PRIMARY KEY,
    keyword VARCHAR(255) NOT NULL,
    category VARCHAR(100) NOT NULL,
    reply TEXT NOT NULL,
    reply_hindi TEXT,
    reply_marathi TEXT,
    image VARCHAR(500) DEFAULT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================
-- PRINCIPAL
-- ============================================================
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('principal', 'principal',
'<b>🎓 Principal</b><br>
<b>Dr. P.V. Thorat</b><br>
<b>Qualification:</b> Ph.D. in Chemical Engineering, M.Tech<br>
<b>Phone:</b> 9960590202<br>
<b>College:</b> College of Engineering and Technology, Akola<br>
<b>Affiliated to:</b> Sant Gadge Baba Amravati University<br>
<b>Office Hours:</b> Mon-Sat, 10:00 AM – 4:00 PM',

'<b>🎓 प्राचार्य</b><br>
<b>डॉ. पी.व्ही. थोरात</b><br>
<b>योग्यता:</b> पीएच.डी. रासायनिक अभियांत्रिकी, एम.टेक<br>
<b>फोन:</b> 9960590202<br>
<b>कार्यालय समय:</b> सोम-शनि, सुबह 10 – शाम 4',

'<b>🎓 प्राचार्य</b><br>
<b>डॉ. पी.व्ही. थोरात</b><br>
<b>पात्रता:</b> पीएच.डी. रासायनिक अभियांत्रिकी, एम.टेक<br>
<b>फोन:</b> 9960590202<br>
<b>कार्यालय वेळ:</b> सोम-शनि, सकाळी 10 – सायंकाळी 4',

'principle.jpeg');

-- ============================================================
-- COURSES / DEPARTMENTS
-- ============================================================
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('course', 'courses',
'<b>📚 Courses Offered - COET Akola</b><br><br>
<b>U.G. Courses:</b><br>
1. B.E. Computer Science & Engineering – 180 seats – 4 Years<br>
2. B.E. Information Technology – 120 seats – 4 Years<br>
3. B.E. Civil Engineering – 60 seats – 4 Years<br>
4. B.E. Mechanical Engineering – 60 seats – 4 Years<br>
5. B.Tech Chemical Engineering – 60 seats – 4 Years<br>
6. B.Arch Architecture – 40 seats – 5 Years<br><br>
<b>P.G. Courses:</b><br>
7. MBA – 60 seats – 2 Years<br>
8. M.E. Computer Science & Engineering – 18 seats – 2 Years<br>
9. M.E. Structural Engineering – 18 seats – 2 Years<br>
10. M.Tech Chemical Engineering – 18 seats – 2 Years<br><br>
<b>Diploma:</b><br>
11. Interior Design (D.Arch) – 40 seats – 3 Years<br><br>
<b>Affiliated to:</b> SGBAU | <b>Approved by:</b> AICTE',

'<b>📚 उपलब्ध कोर्स - COET अकोला</b><br>
<b>यू.जी. कोर्स:</b><br>
1. बी.ई. कंप्यूटर साइंस – 180 सीटें – 4 साल<br>
2. बी.ई. इन्फॉर्मेशन टेक्नोलॉजी – 120 सीटें – 4 साल<br>
3. बी.ई. सिविल – 60 सीटें – 4 साल<br>
4. बी.ई. मैकेनिकल – 60 सीटें – 4 साल<br>
5. बी.टेक केमिकल – 60 सीटें – 4 साल<br>
6. बी.आर्क आर्किटेक्चर – 40 सीटें – 5 साल<br>
<b>पी.जी. कोर्स:</b><br>
7. MBA – 60 सीटें – 2 साल<br>
8. M.E. CSE – 18 सीटें – 2 साल<br>
9. M.E. स्ट्रक्चरल – 18 सीटें – 2 साल<br>
10. M.Tech केमिकल – 18 सीटें – 2 साल<br>
<b>डिप्लोमा:</b> इंटीरियर डिज़ाइन – 40 सीटें – 3 साल',

'<b>📚 उपलब्ध अभ्यासक्रम - COET अकोला</b><br>
<b>यू.जी. अभ्यासक्रम:</b><br>
1. बी.ई. संगणक विज्ञान – 180 जागा – 4 वर्षे<br>
2. बी.ई. माहिती तंत्रज्ञान – 120 जागा – 4 वर्षे<br>
3. बी.ई. स्थापत्य – 60 जागा – 4 वर्षे<br>
4. बी.ई. यांत्रिकी – 60 जागा – 4 वर्षे<br>
5. बी.टेक रासायनिक – 60 जागा – 4 वर्षे<br>
6. बी.आर्क – 40 जागा – 5 वर्षे<br>
<b>पी.जी.:</b> MBA, M.E. CSE, M.E. Structural, M.Tech Chemical<br>
<b>डिप्लोमा:</b> इंटेरियर डिझाईन – 40 जागा – 3 वर्षे',

NULL);

-- ============================================================
-- DEPARTMENTS - CSE
-- ============================================================
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('computer', 'departments',
'<b>🖥️ Computer Science & Engineering Department</b><br>
<b>Seats:</b> 180 | <b>Duration:</b> 4 Years<br><br>
<b>Faculty:</b><br>
• Dr. S.L. Satarkar<br>
• Dr. R.S. Jaiswal<br>
• Dr. S.S. Agrawal<br>
• Dr. K.S. Gilda – Associate Professor<br>
• Dr. S.A. Awachar – Associate Professor<br>
• Dr. V.R. Tripathi – Associate Professor<br>
• Dr. S.K. Agrawal – Associate Professor<br>
• Dr. M.K. Deshmukh – Associate Professor<br>
• Dr. M. Mandapati<br>
• Prof. S.A. Bobade – Assistant Professor<br>
• Prof. Mrs. S.S. Dixit – Assistant Professor<br>
• Prof. M.S. Shegokar – Assistant Professor<br>
• Prof. K.P. Barabde – Assistant Professor<br>
• Prof. R.J. Deshmukh – Assistant Professor<br>
• Prof. P.A. Tayade – Assistant Professor<br>
• Prof. J. Balinge',

'<b>🖥️ कंप्यूटर साइंस & इंजीनियरिंग विभाग</b><br>
<b>सीटें:</b> 180 | <b>अवधि:</b> 4 साल<br>
<b>फैकल्टी:</b> Dr. S.L. Satarkar, Dr. R.S. Jaiswal, Dr. S.S. Agrawal, Dr. K.S. Gilda, Dr. S.A. Awachar, Dr. V.R. Tripathi, Prof. S.A. Bobade, Prof. M.S. Shegokar, Prof. K.P. Barabde, Prof. R.J. Deshmukh, Prof. P.A. Tayade एवं अन्य।',

'<b>🖥️ संगणक विज्ञान व अभियांत्रिकी विभाग</b><br>
<b>जागा:</b> 180 | <b>कालावधी:</b> 4 वर्षे<br>
<b>प्राध्यापक:</b> Dr. S.L. Satarkar, Dr. R.S. Jaiswal, Dr. S.S. Agrawal, Dr. K.S. Gilda, Prof. S.A. Bobade, Prof. K.P. Barabde, Prof. P.A. Tayade इतर.',

NULL);

-- ============================================================
-- DEPARTMENTS - IT
-- ============================================================
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('information technology', 'departments',
'<b>💻 Information Technology Department</b><br>
<b>Seats:</b> 120 | <b>Duration:</b> 4 Years<br><br>
<b>Faculty:</b><br>
• Dr. R.A. Taley – HOD & Associate Professor<br>
• Mrs. Priyanka P. Mahalle – Assistant Professor<br>
• Prof. Mr. Rahul M. Bhutada – Assistant Professor',

'<b>💻 इन्फॉर्मेशन टेक्नोलॉजी विभाग</b><br>
<b>सीटें:</b> 120 | <b>अवधि:</b> 4 साल<br>
<b>HOD:</b> Dr. R.A. Taley<br>
<b>फैकल्टी:</b> Mrs. Priyanka P. Mahalle, Prof. Rahul M. Bhutada',

'<b>💻 माहिती तंत्रज्ञान विभाग</b><br>
<b>जागा:</b> 120 | <b>कालावधी:</b> 4 वर्षे<br>
<b>HOD:</b> Dr. R.A. Taley<br>
<b>प्राध्यापक:</b> Mrs. Priyanka P. Mahalle, Prof. Rahul M. Bhutada',

NULL);

-- ============================================================
-- DEPARTMENTS - CIVIL
-- ============================================================
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('civil', 'departments',
'<b>🏗️ Civil Engineering Department</b><br>
<b>Seats:</b> 60 | <b>Duration:</b> 4 Years<br><br>
<b>Faculty:</b><br>
• Dr. A.R. Gupta – HOD & Professor (M.E, PG in ACM, MBA, Ph.D)<br>
• Dr. A.T. Tathod – Associate Professor (M.E Env Engg., Ph.D)<br>
• Prof. C.S. Kulat – Associate Professor of Practice (M.E Structural)<br>
• Prof. R.M. Phuke – Assistant Professor (M.E Structural)<br>
• Prof. P.M. Raut – Assistant Professor (M.E Env Engg.)<br>
• Prof. G.R. Bharsakle – Assistant Professor (M.E Structural)<br>
• Prof. D.A. Zamre – Assistant Professor (M.E Structural)<br>
• Prof. A.S. Gangane – Assistant Professor (M.E CEM, PGDUPDL)<br>
• Prof. Miss V.N. Wankhade – Assistant Professor (M.Tech Structural)<br>
• Prof. A.S. Kalmegh – Assistant Professor (M.E Environment)<br>
• Prof. S.P. Chore – Assistant Professor (M.E Structure)<br>
• Prof. P.R. Peshwe – Assistant Professor (M.E Structural)<br>
• Prof. P. Mahale',

'<b>🏗️ सिविल इंजीनियरिंग विभाग</b><br>
<b>सीटें:</b> 60 | <b>HOD:</b> Dr. A.R. Gupta<br>
<b>फैकल्टी:</b> Dr. A.T. Tathod, Prof. C.S. Kulat, Prof. R.M. Phuke, Prof. P.M. Raut, Prof. G.R. Bharsakle, Prof. D.A. Zamre, Prof. A.S. Gangane, Prof. V.N. Wankhade, Prof. A.S. Kalmegh, Prof. S.P. Chore, Prof. P.R. Peshwe, Prof. P. Mahale',

'<b>🏗️ स्थापत्य अभियांत्रिकी विभाग</b><br>
<b>जागा:</b> 60 | <b>HOD:</b> Dr. A.R. Gupta<br>
<b>प्राध्यापक:</b> Dr. A.T. Tathod, Prof. C.S. Kulat, Prof. R.M. Phuke, Prof. P.M. Raut, Prof. G.R. Bharsakle, Prof. D.A. Zamre इतर.',

NULL);

-- ============================================================
-- DEPARTMENTS - MECHANICAL
-- ============================================================
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('mechanical', 'departments',
'<b>⚙️ Mechanical Engineering Department</b><br>
<b>Seats:</b> 60 | <b>Duration:</b> 4 Years<br><br>
<b>Faculty:</b><br>
• Dr. S.C. Makwana – Head & Associate Professor<br>
• Dr. P.S. Ardak – Associate Professor<br>
• Prof. S.P. Dhomane – Assistant Professor<br>
• Prof. S.R. Alase – Assistant Professor<br>
• Prof. S.R. Thakare – Assistant Professor<br>
• Prof. M.R. Pundkar – Assistant Professor<br>
• Prof. A.S. Tolmare – Assistant Professor<br>
• Prof. C.V. Bahagt – Assistant Professor',

'<b>⚙️ मैकेनिकल इंजीनियरिंग विभाग</b><br>
<b>सीटें:</b> 60 | <b>HOD:</b> Dr. S.C. Makwana<br>
<b>फैकल्टी:</b> Dr. P.S. Ardak, Prof. S.P. Dhomane, Prof. S.R. Alase, Prof. S.R. Thakare, Prof. M.R. Pundkar, Prof. A.S. Tolmare, Prof. C.V. Bahagt',

'<b>⚙️ यांत्रिकी अभियांत्रिकी विभाग</b><br>
<b>जागा:</b> 60 | <b>HOD:</b> Dr. S.C. Makwana<br>
<b>प्राध्यापक:</b> Dr. P.S. Ardak, Prof. S.P. Dhomane, Prof. S.R. Alase, Prof. S.R. Thakare, Prof. M.R. Pundkar इतर.',

NULL);

-- ============================================================
-- DEPARTMENTS - CHEMICAL
-- ============================================================
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('chemical', 'departments',
'<b>🧪 Chemical Engineering Department</b><br>
<b>Seats:</b> 60 | <b>Duration:</b> 4 Years<br><br>
<b>Faculty:</b><br>
• Dr. P.V. Thorat – Principal & Professor<br>
• Dr. Gopal S. Zamre – Head & Associate Professor<br>
• Dr. D.V. Wele – Associate Professor<br>
• Dr. M.S. Patil – Associate Professor<br>
• Dr. S.V. Khedkar – Associate Professor<br>
• Dr. A.P. Gawande – Assistant Professor<br>
• Prof. R.S. Jadhao – Assistant Professor<br>
• Prof. M.A. Badole – Assistant Professor<br>
• Prof. N.P. Sirse – Assistant Professor',

'<b>🧪 केमिकल इंजीनियरिंग विभाग</b><br>
<b>सीटें:</b> 60 | <b>HOD:</b> Dr. Gopal S. Zamre<br>
<b>फैकल्टी:</b> Dr. D.V. Wele, Dr. M.S. Patil, Dr. S.V. Khedkar, Dr. A.P. Gawande, Prof. R.S. Jadhao, Prof. M.A. Badole, Prof. N.P. Sirse',

'<b>🧪 रासायनिक अभियांत्रिकी विभाग</b><br>
<b>जागा:</b> 60 | <b>HOD:</b> Dr. Gopal S. Zamre<br>
<b>प्राध्यापक:</b> Dr. D.V. Wele, Dr. M.S. Patil, Dr. S.V. Khedkar, Dr. A.P. Gawande इतर.',

NULL);

-- ============================================================
-- DEPARTMENTS - MBA
-- ============================================================
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('mba', 'departments',
'<b>💼 MBA Department</b><br>
<b>Seats:</b> 60 | <b>Duration:</b> 2 Years<br><br>
<b>Faculty:</b><br>
• Prof. S.R. Sonkhaskar – HOD<br>
• Prof. A.N. Tayade – Assistant Professor<br>
• Prof. V.R. Kokatay – Assistant Professor<br>
• Prof. K.P. Shingote – Assistant Professor',

'<b>💼 MBA विभाग</b><br>
<b>सीटें:</b> 60 | <b>HOD:</b> Prof. S.R. Sonkhaskar<br>
<b>फैकल्टी:</b> Prof. A.N. Tayade, Prof. V.R. Kokatay, Prof. K.P. Shingote',

'<b>💼 MBA विभाग</b><br>
<b>जागा:</b> 60 | <b>HOD:</b> Prof. S.R. Sonkhaskar<br>
<b>प्राध्यापक:</b> Prof. A.N. Tayade, Prof. V.R. Kokatay, Prof. K.P. Shingote',

NULL);

-- ============================================================
-- DEPARTMENTS - ME CSE (FYMC)
-- ============================================================
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('me cse', 'departments',
'<b>🖥️ M.E. Computer Science & Engineering</b><br>
<b>Seats:</b> 18 | <b>Duration:</b> 2 Years<br>
<b>FYMC Chairman & HOD:</b> Dr. P.S. Ardak – Associate Professor<br><br>
<b>Faculty:</b><br>
• Dr. P.D. Bhanavat – Assistant Professor<br>
• Dr. J.V. Shegokar – Assistant Professor<br>
• Dr. D.D. Raut – Assistant Professor<br>
• Prof. S.J. Ningwal – Assistant Professor<br>
• Prof. S.D. Deshmukh – Assistant Professor<br>
• Prof. A.A. Bihade – Assistant Professor<br>
• Prof. R.U. Pote – Assistant Professor<br>
• Prof. K.V. Nile – Assistant Professor<br>
• Prof. S.S. Kale – Assistant Professor<br>
• Prof. R.D. Bhire – Assistant Professor<br>
• Prof. A.S. Gawande<br>
• Prof. A.S. Vidhale<br>
• Prof. S.B. Sonawane',

'<b>🖥️ M.E. कंप्यूटर साइंस</b><br>
<b>सीटें:</b> 18 | <b>HOD:</b> Dr. P.S. Ardak<br>
<b>फैकल्टी:</b> Dr. P.D. Bhanavat, Dr. J.V. Shegokar, Dr. D.D. Raut, Prof. S.J. Ningwal, Prof. S.D. Deshmukh, Prof. A.A. Bihade, Prof. R.U. Pote, Prof. K.V. Nile, Prof. S.S. Kale, Prof. A.S. Gawande इतर।',

'<b>🖥️ M.E. संगणक विज्ञान</b><br>
<b>जागा:</b> 18 | <b>HOD:</b> Dr. P.S. Ardak<br>
<b>प्राध्यापक:</b> Dr. P.D. Bhanavat, Dr. J.V. Shegokar, Dr. D.D. Raut, Prof. S.J. Ningwal इतर.',

NULL);

-- ============================================================
-- FEES
-- ============================================================
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('fee', 'fees',
'<b>💰 Fee Structure 2025-2026 - COET Akola</b><br><br>
<b>U.G. Courses (B.E. / B.Tech / B.Arch):</b><br>
<table style="border-collapse:collapse;width:100%;font-size:12px;">
<tr style="background:#1e88e5;color:white;">
<td style="padding:4px 6px;"><b>Course</b></td>
<td style="padding:4px 6px;"><b>Open/CAP</b></td>
<td style="padding:4px 6px;"><b>OBC/EBC</b></td>
<td style="padding:4px 6px;"><b>VJ/NT/TFWS</b></td>
<td style="padding:4px 6px;"><b>SC/ST</b></td>
</tr>
<tr><td style="padding:3px 6px;">B.E. First Year</td><td>₹1,20,531</td><td>₹69,439</td><td>₹18,347</td><td>₹3,531</td></tr>
<tr style="background:#f0f4ff;"><td style="padding:3px 6px;">B.Arch First Year</td><td>₹1,19,264</td><td>₹67,937</td><td>₹16,609</td><td>₹3,264</td></tr>
<tr><td style="padding:3px 6px;">B.E. Direct 2nd Year</td><td>₹1,09,284</td><td>₹62,574</td><td>₹15,864</td><td>₹2,784</td></tr>
<tr style="background:#f0f4ff;"><td style="padding:3px 6px;">MBA</td><td>₹1,01,864</td><td>₹56,410</td><td>₹10,955</td><td>₹1,864</td></tr>
<tr><td style="padding:3px 6px;">M.E./M.Tech</td><td>₹1,00,444</td><td>₹1,00,444</td><td>₹1,00,444</td><td>₹2,444</td></tr>
<tr style="background:#f0f4ff;"><td style="padding:3px 6px;">D.Arch (Diploma)</td><td>₹47,454</td><td>₹27,000</td><td>₹6,545</td><td>₹2,454</td></tr>
</table><br>
<b>Note:</b> Fees as per FRA, FFC, SGBAU & MSBTE. Subject to change.<br>
<b>Scholarships:</b> Available for SC/ST, OBC, EWS & Girls (TFWS)',

'<b>💰 शुल्क संरचना 2025-2026</b><br>
• बी.ई. प्रथम वर्ष (Open): ₹1,20,531 | OBC: ₹69,439 | SC/ST: ₹3,531<br>
• बी.आर्क (Open): ₹1,19,264 | OBC: ₹67,937<br>
• बी.ई. द्वितीय वर्ष (Open): ₹1,09,284<br>
• MBA (Open): ₹1,01,864 | OBC: ₹56,410<br>
• M.E./M.Tech: ₹1,00,444 | SC only: ₹2,444<br>
• D.Arch डिप्लोमा (Open): ₹47,454<br>
<b>छात्रवृत्ति:</b> SC/ST, OBC, EWS एवं Girls TFWS के लिए उपलब्ध',

'<b>💰 शुल्क रचना 2025-2026</b><br>
• बी.ई. प्रथम वर्ष (Open): ₹1,20,531 | OBC: ₹69,439 | SC/ST: ₹3,531<br>
• बी.आर्क (Open): ₹1,19,264<br>
• MBA (Open): ₹1,01,864<br>
• M.E./M.Tech: ₹1,00,444<br>
• D.Arch (Open): ₹47,454<br>
<b>शिष्यवृत्ती:</b> SC/ST, OBC, EWS व मुलींसाठी उपलब्ध',

NULL);

-- ============================================================
-- HOSTEL
-- ============================================================
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('hostel', 'hostel',
'<b>🏠 Hostel Facility - COET Akola</b><br><br>
<b>Girls Hostel:</b> Available on campus<br>
<b>Room Sharing:</b> 4 girls per room<br><br>
<b>Facilities:</b><br>
• 24x7 Water Supply<br>
• Wi-Fi Facility<br>
• Mess Facility (Hygienic food)<br>
• Study Room<br>
• Common Washroom<br>
• Clean and Hygienic Environment<br>
• CCTV Surveillance<br>
• Warden available 24/7<br><br>
<b>Rules:</b><br>
• Back by 8:30 PM mandatory<br>
• Parents visiting hours: 6:00 PM – 8:00 PM<br>
• Zero tolerance to ragging<br><br>
<b>Annual Hostel Fee:</b> ₹24,000 (Approx.)<br>
<b>Location:</b> Babhulgaon (Jh) N.H. No. 6, Akola – 444 104',

'<b>🏠 छात्रावास सुविधा - COET अकोला</b><br>
<b>गर्ल्स हॉस्टल:</b> कैंपस में उपलब्ध<br>
<b>कमरा:</b> 4 लड़कियां प्रति कमरा<br>
<b>सुविधाएं:</b><br>
• 24x7 पानी की आपूर्ति<br>
• Wi-Fi सुविधा<br>
• मेस (स्वच्छ भोजन)<br>
• अध्ययन कक्ष<br>
• CCTV निगरानी<br>
• वार्डन 24/7 उपलब्ध<br>
<b>नियम:</b> रात 8:30 बजे तक वापस आना अनिवार्य<br>
<b>वार्षिक शुल्क:</b> ₹24,000 (लगभग)',

'<b>🏠 वसतिगृह सुविधा - COET अकोला</b><br>
<b>मुलींचे वसतिगृह:</b> कॅम्पसमध्ये उपलब्ध<br>
<b>खोली:</b> 4 मुली प्रति खोली<br>
<b>सुविधा:</b><br>
• 24x7 पाण्याचा पुरवठा<br>
• Wi-Fi सुविधा<br>
• मेस (स्वच्छ जेवण)<br>
• अभ्यास कक्ष<br>
• CCTV देखरेख<br>
<b>नियम:</b> रात्री 8:30 पर्यंत परतणे बंधनकारक<br>
<b>वार्षिक शुल्क:</b> ₹24,000 (अंदाजे)',

'hostel_front.jpeg,hostel_building.jpeg,hostel_side.jpeg,hostel_corridor.jpeg,hostel_mess.jpeg');

-- ============================================================
-- LIBRARY
-- ============================================================
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('library', 'library',
'<b>📖 Central Library - COET Akola</b><br><br>
<b>Library Timing:</b> 9:00 AM – 5:00 PM (Mon-Sat)<br><br>
<b>Books Collection (Course-wise):</b><br>
• Mechanical Engineering: 2417 titles, 7921 volumes<br>
• Chemical Engineering: 1629 titles, 6897 volumes<br>
• Civil Engineering: 1911 titles, 6268 volumes<br>
• Computer Science & Engg: 1267 titles, 7723 volumes<br>
• B. Architecture: 2200 titles, 3441 volumes<br>
• Science & Humanities: 3199 titles, 8264 volumes<br>
• Bound Volumes: 19,08,246<br><br>
<b>Total: 12,623 titles | 40,514 volumes</b><br>
<b>Total Cost:</b> ₹1,95,25,292<br><br>
<b>Facilities:</b> Reading hall, Reference section, Digital catalogue',

'<b>📖 केंद्रीय पुस्तकालय - COET अकोला</b><br>
<b>समय:</b> सुबह 9 बजे – शाम 5 बजे (सोम-शनि)<br>
<b>पुस्तकें:</b><br>
• मैकेनिकल: 2417 शीर्षक, 7921 खंड<br>
• केमिकल: 1629 शीर्षक, 6897 खंड<br>
• सिविल: 1911 शीर्षक, 6268 खंड<br>
• CSE: 1267 शीर्षक, 7723 खंड<br>
• आर्किटेक्चर: 2200 शीर्षक, 3441 खंड<br>
• विज्ञान & मानविकी: 3199 शीर्षक, 8264 खंड<br>
<b>कुल: 12,623 शीर्षक | 40,514 खंड</b>',

'<b>📖 मध्यवर्ती ग्रंथालय - COET अकोला</b><br>
<b>वेळ:</b> सकाळी 9 – सायंकाळी 5 (सोम-शनि)<br>
<b>पुस्तके:</b><br>
• यांत्रिकी: 2417 शीर्षक, 7921 खंड<br>
• रासायनिक: 1629 शीर्षक, 6897 खंड<br>
• स्थापत्य: 1911 शीर्षक, 6268 खंड<br>
• CSE: 1267 शीर्षक, 7723 खंड<br>
<b>एकूण: 12,623 शीर्षक | 40,514 खंड</b>',

'library1.jpeg,library2.jpeg');

-- ============================================================
-- CANTEEN
-- ============================================================
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('canteen', 'canteen',
'<b>🍽️ Canteen - COET Akola</b><br><br>
<b>Canteen is available on campus!</b><br><br>
<b>Facilities:</b><br>
• Spacious & clean dining area<br>
• Hygienic food at affordable prices<br>
• Comfortable seating arrangement<br>
• Available for all students & staff<br><br>
<b>Note:</b> More details about menu & timing will be updated soon.<br>
<b>Location:</b> Inside campus premises',

'<b>🍽️ कैंटीन - COET अकोला</b><br>
<b>कैंटीन कैंपस में उपलब्ध है!</b><br>
<b>सुविधाएं:</b><br>
• स्वच्छ और विशाल भोजन क्षेत्र<br>
• किफायती कीमतों पर स्वच्छ भोजन<br>
• सभी छात्रों और स्टाफ के लिए उपलब्ध',

'<b>🍽️ कॅन्टीन - COET अकोला</b><br>
<b>कॅन्टीन कॅम्पसमध्ये उपलब्ध आहे!</b><br>
<b>सुविधा:</b><br>
• स्वच्छ व प्रशस्त जेवण क्षेत्र<br>
• परवडणाऱ्या किमतीत स्वच्छ जेवण<br>
• सर्व विद्यार्थी व कर्मचाऱ्यांसाठी उपलब्ध',

'canteen1.jpeg');

-- ============================================================
-- PLACEMENT
-- ============================================================
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('placement', 'placement',
'<b>💼 Placement Cell - COET Akola</b><br><br>
<b>Head of Placement Cell:</b> Dr. Agrawal Sir<br>
<b>Internship Head:</b> Prof. K. Barabde Mam<br><br>
<b>Placement Statistics:</b><br>
• Total Placements: 350+<br>
• Students Placed Per Year: ~53<br>
• B.Tech/B.Arch Average Package: ₹2-3 LPA<br><br>
<b>Top Recruiters:</b><br>
• TCS<br>
• Wipro<br>
• Capgemini<br>
• And many more...<br><br>
<b>Training:</b> Aptitude, Technical & Soft Skills training provided<br>
<b>Internship:</b> Regular internship opportunities available',

'<b>💼 प्लेसमेंट सेल - COET अकोला</b><br>
<b>प्लेसमेंट प्रमुख:</b> Dr. Agrawal Sir<br>
<b>इंटर्नशिप प्रमुख:</b> Prof. K. Barabde Mam<br>
<b>कुल प्लेसमेंट:</b> 350+<br>
<b>प्रति वर्ष:</b> ~53 छात्र<br>
<b>औसत पैकेज:</b> ₹2-3 LPA (B.Tech/B.Arch)<br>
<b>शीर्ष कंपनियां:</b> TCS, Wipro, Capgemini',

'<b>💼 प्लेसमेंट सेल - COET अकोला</b><br>
<b>प्लेसमेंट प्रमुख:</b> Dr. Agrawal Sir<br>
<b>इंटर्नशिप प्रमुख:</b> Prof. K. Barabde Mam<br>
<b>एकूण प्लेसमेंट:</b> 350+<br>
<b>प्रति वर्ष:</b> ~53 विद्यार्थी<br>
<b>सरासरी पॅकेज:</b> ₹2-3 LPA (B.Tech/B.Arch)<br>
<b>शीर्ष कंपन्या:</b> TCS, Wipro, Capgemini',

NULL);

-- ============================================================
-- TRANSPORT
-- ============================================================
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('transport', 'transport',
'<b>🚌 Transport Facility - COET Akola</b><br><br>
<b>College Buses Available!</b><br>
College of Engineering and Technology, Akola provides bus facility for students.<br><br>
<b>Features:</b><br>
• Multiple college buses available<br>
• Covers various routes in and around Akola<br>
• Safe and reliable transport<br><br>
<b>For Route & Timing Details:</b><br>
Contact the college office or transport in-charge.<br>
<b>Phone:</b> 9960590202',

'<b>🚌 परिवहन सुविधा - COET अकोला</b><br>
<b>कॉलेज बस उपलब्ध!</b><br>
अकोला और आसपास के क्षेत्रों के लिए बस सुविधा उपलब्ध है।<br>
<b>रूट और समय के लिए:</b> कॉलेज कार्यालय से संपर्क करें।<br>
<b>फोन:</b> 9960590202',

'<b>🚌 वाहतूक सुविधा - COET अकोला</b><br>
<b>महाविद्यालय बस उपलब्ध!</b><br>
अकोला व परिसरातील विद्यार्थ्यांसाठी बस सुविधा उपलब्ध आहे.<br>
<b>मार्ग व वेळासाठी:</b> महाविद्यालय कार्यालयाशी संपर्क करा.<br>
<b>फोन:</b> 9960590202',

'bus1.jpeg');

-- ============================================================
-- CONTACT
-- ============================================================
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('contact', 'contact',
'<b>📞 Contact - COET Akola</b><br><br>
<b>College of Engineering and Technology, Akola</b><br>
Shri Shivaji Education Society, Amravati<br>
Babhulgaon (Jh) N.H. No. 6, Akola – 444 104<br><br>
<b>Principal:</b> Dr. P.V. Thorat<br>
📞 9960590202<br><br>
<b>Affiliated to:</b> Sant Gadge Baba Amravati University<br>
<b>Approved by:</b> AICTE<br>
<b>NAAC:</b> Accredited with Grade "A"<br><br>
<b>Office Hours:</b> Mon-Sat, 9:00 AM – 5:00 PM',

'<b>📞 संपर्क - COET अकोला</b><br>
<b>कॉलेज ऑफ इंजीनियरिंग एंड टेक्नोलॉजी, अकोला</b><br>
श्री शिवाजी शिक्षण संस्था, अमरावती<br>
बाभुळगाव (झ) NH No. 6, अकोला – 444 104<br>
<b>प्राचार्य:</b> Dr. P.V. Thorat | 📞 9960590202<br>
<b>कार्यालय समय:</b> सोम-शनि, सुबह 9 – शाम 5',

'<b>📞 संपर्क - COET अकोला</b><br>
<b>कॉलेज ऑफ इंजिनिअरिंग अँड टेक्नॉलॉजी, अकोला</b><br>
श्री शिवाजी शिक्षण संस्था, अमरावती<br>
बाभूळगाव (झ) NH No. 6, अकोला – 444 104<br>
<b>प्राचार्य:</b> Dr. P.V. Thorat | 📞 9960590202<br>
<b>कार्यालय वेळ:</b> सोम-शनि, सकाळी 9 – सायंकाळी 5',

NULL);

-- ============================================================
-- LOCATION / CAMPUS MAP
-- ============================================================
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('location', 'location',
'<b>📍 Campus Location - COET Akola</b><br><br>
<b>Address:</b><br>
College of Engineering and Technology,<br>
Babhulgaon (Jh) N.H. No. 6, Akola – 444 104<br><br>
<b>Campus Facilities Location:</b><br>
🏛️ Main Building – Administrative Office, Principal Office<br>
🖥️ CSE & IT Department – Main Academic Block<br>
🏗️ Civil & Mechanical Department – Engineering Block<br>
🧪 Chemical Department – Lab Block<br>
🏠 Girls Hostel – Inside Campus (Separate Block)<br>
📖 Library – Ground Floor, Main Building<br>
🍽️ Canteen – Campus Premises<br>
🚌 Bus Stand – College Gate<br>
🏟️ Playground – Open Ground Area<br><br>
<b>How to Reach:</b><br>
• Located on NH No. 6, Babhulgaon<br>
• Near Akola City<br>
<b>Google Maps:</b> Search "COET Akola" or "College of Engineering and Technology Akola"',

'<b>📍 कैंपस लोकेशन - COET अकोला</b><br>
<b>पता:</b> बाभुळगाव (झ) NH No. 6, अकोला – 444 104<br>
<b>कैंपस में:</b><br>
🏛️ मुख्य भवन – प्रशासनिक कार्यालय<br>
🏠 गर्ल्स हॉस्टल – अलग ब्लॉक<br>
📖 पुस्तकालय – मुख्य भवन तल मंजिल<br>
🍽️ कैंटीन – कैंपस परिसर<br>
🚌 बस स्टैंड – कॉलेज गेट<br>
<b>Google Maps:</b> "COET Akola" सर्च करें',

'<b>📍 कॅम्पस स्थान - COET अकोला</b><br>
<b>पत्ता:</b> बाभूळगाव (झ) NH No. 6, अकोला – 444 104<br>
<b>कॅम्पसमध्ये:</b><br>
🏛️ मुख्य इमारत – प्रशासकीय कार्यालय<br>
🏠 मुलींचे वसतिगृह – स्वतंत्र ब्लॉक<br>
📖 ग्रंथालय – मुख्य इमारत तळमजला<br>
🍽️ कॅन्टीन – कॅम्पस परिसर<br>
🚌 बस स्टँड – महाविद्यालय दरवाजा<br>
<b>Google Maps:</b> "COET Akola" शोधा',

NULL);

-- ============================================================
-- ADMISSION
-- ============================================================
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('admission', 'admission',
'<b>📋 Admission - COET Akola</b><br><br>
<b>Eligibility:</b><br>
• B.E./B.Tech: 12th PCM with min. 45% (40% for reserved)<br>
• B.Arch: 12th with Maths + NATA score<br>
• MBA: Graduation with 50% marks<br>
• M.E./M.Tech: B.E./B.Tech with 50% marks<br>
• Diploma (D.Arch): 10th pass<br><br>
<b>Entrance Exams Required:</b><br>
• B.E.: MHT-CET / JEE Mains<br>
• B.Arch: MHT-CET / NATA<br>
• MBA: MAT / CAT / MH-CET<br><br>
<b>Documents Required:</b><br>
10th & 12th Marksheet, Leaving Certificate, Aadhar Card, Passport Size Photo (6), Caste Certificate (if applicable)<br><br>
<b>Contact:</b> 9960590202<br>
<b>Office:</b> Mon-Sat, 9:00 AM – 5:00 PM',

'<b>📋 प्रवेश प्रक्रिया - COET अकोला</b><br>
<b>पात्रता:</b><br>
• बी.ई.: 12वीं PCM 45% | MBA: स्नातक 50%<br>
<b>प्रवेश परीक्षा:</b> MHT-CET / JEE (B.E.) | MAT/CAT (MBA)<br>
<b>दस्तावेज:</b> 10वीं/12वीं मार्कशीट, LC, आधार, फोटो<br>
<b>संपर्क:</b> 9960590202',

'<b>📋 प्रवेश प्रक्रिया - COET अकोला</b><br>
<b>पात्रता:</b><br>
• बी.ई.: 12वी PCM 45% | MBA: पदवी 50%<br>
<b>प्रवेश परीक्षा:</b> MHT-CET / JEE (B.E.) | MAT/CAT (MBA)<br>
<b>कागदपत्रे:</b> 10वी/12वी गुणपत्रिका, LC, आधार, फोटो<br>
<b>संपर्क:</b> 9960590202',

NULL);

-- ============================================================
-- GREET
-- ============================================================
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('hello', 'greet',
'👋 Hello! Welcome to <b>COET Akola Chatbot</b>!<br>
College of Engineering and Technology, Akola<br>
(Shri Shivaji Education Society, Amravati)<br><br>
I can help you with:<br>
🎓 Principal | 📚 Courses | 💰 Fees | 🏠 Hostel<br>
📖 Library | 🍽️ Canteen | 💼 Placement | 📋 Admission<br>
📞 Contact | 📍 Location | 🚌 Transport | 🏗️ Departments<br><br>
Type your question in English, Hindi or Marathi!',

'👋 नमस्ते! <b>COET अकोला चैटबॉट</b> में आपका स्वागत है!<br>
मैं आपकी मदद कर सकता हूँ: प्राचार्य, कोर्स, शुल्क, छात्रावास, पुस्तकालय, कैंटीन, प्लेसमेंट, प्रवेश, संपर्क के बारे में।<br>
अंग्रेजी, हिंदी या मराठी में पूछें!',

'👋 नमस्कार! <b>COET अकोला चॅटबॉट</b>मध्ये आपले स्वागत!<br>
मी मदत करू शकतो: प्राचार्य, अभ्यासक्रम, शुल्क, वसतिगृह, ग्रंथालय, कॅन्टीन, प्लेसमेंट, प्रवेश, संपर्क.<br>
इंग्रजी, हिंदी किंवा मराठीत विचारा!',

NULL);

INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('hi', 'greet',
'👋 Hi! Welcome to <b>COET Akola Bot</b>!<br>Ask me about courses, fees, hostel, placement, admission or any college info!',
'👋 नमस्ते! COET अकोला बॉट में आपका स्वागत! कोई भी जानकारी पूछें।',
'👋 नमस्कार! COET अकोला बॉटमध्ये स्वागत! कोणतीही माहिती विचारा.',
NULL);

-- Hindi keywords
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('नमस्ते', 'greet',
'👋 Hello! Welcome to COET Akola Chatbot! Ask me anything about the college.',
'👋 नमस्ते! COET अकोला चैटबॉट में स्वागत है! कॉलेज के बारे में कुछ भी पूछें।',
'👋 नमस्कार! COET अकोला चॅटबॉटमध्ये स्वागत! महाविद्यालयाबद्दल काहीही विचारा.',
NULL);

INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('प्राचार्य', 'principal',
'<b>🎓 Principal - Dr. P.V. Thorat</b><br>Ph.D. Chemical Engineering, M.Tech<br>Phone: 9960590202',
'<b>🎓 प्राचार्य - डॉ. पी.व्ही. थोरात</b><br>पीएच.डी. रासायनिक अभियांत्रिकी, एम.टेक<br>फोन: 9960590202',
'<b>🎓 प्राचार्य - डॉ. पी.व्ही. थोरात</b><br>पीएच.डी. रासायनिक अभियांत्रिकी, एम.टेक<br>फोन: 9960590202',
'principle.jpeg');

INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('छात्रावास', 'hostel',
'<b>🏠 Girls Hostel - COET Akola</b><br>4 girls per room | 24x7 Water | WiFi | Mess | Study Room<br>Annual Fee: ₹24,000 (Approx.)',
'<b>🏠 गर्ल्स हॉस्टल</b><br>4 लड़कियां/कमरा | 24x7 पानी | WiFi | मेस | अध्ययन कक्ष<br>वार्षिक शुल्क: ₹24,000 (लगभग)',
'<b>🏠 मुलींचे वसतिगृह</b><br>4 मुली/खोली | 24x7 पाणी | WiFi | मेस | अभ्यास कक्ष<br>वार्षिक शुल्क: ₹24,000 (अंदाजे)',
'hostel_front.jpeg,hostel_building.jpeg,hostel_side.jpeg');

INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('वसतिगृह', 'hostel',
'<b>🏠 Girls Hostel - COET Akola</b><br>4 girls per room | 24x7 Water | WiFi | Mess | Study Room<br>Annual Fee: ₹24,000 (Approx.)',
'<b>🏠 गर्ल्स हॉस्टल</b><br>4 लड़कियां/कमरा | 24x7 पानी | WiFi | मेस<br>वार्षिक शुल्क: ₹24,000',
'<b>🏠 मुलींचे वसतिगृह</b><br>4 मुली/खोली | 24x7 पाणी | WiFi | मेस<br>वार्षिक शुल्क: ₹24,000 (अंदाजे)',
'hostel_front.jpeg,hostel_building.jpeg,hostel_side.jpeg');

INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('प्रवेश', 'admission',
'<b>📋 Admission - COET Akola</b><br>B.E.: 12th PCM 45% | MBA: Graduation 50%<br>Entrance: MHT-CET/JEE | Contact: 9960590202',
'<b>📋 प्रवेश - COET अकोला</b><br>बी.ई.: 12वीं PCM 45% | MBA: स्नातक 50%<br>प्रवेश परीक्षा: MHT-CET/JEE | संपर्क: 9960590202',
'<b>📋 प्रवेश - COET अकोला</b><br>बी.ई.: 12वी PCM 45% | MBA: पदवी 50%<br>प्रवेश परीक्षा: MHT-CET/JEE | संपर्क: 9960590202',
NULL);

-- ============================================================
SELECT COUNT(*) AS total_keywords FROM chatbot;

-- ============================================================
-- NEW VISITOR / PARENT / STUDENT / STAFF COMMON QUESTIONS
-- ============================================================

-- SAFETY & SECURITY
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('safety', 'campus_info',
'<b>🔒 Campus Safety - COET Akola</b><br><br>
<b>Security Measures:</b><br>
• 24x7 Security Guard at main gate<br>
• CCTV Surveillance throughout campus<br>
• ID Card mandatory for entry<br>
• Visitor entry with prior permission<br>
• Emergency contact: 9960590202<br><br>
<b>Anti-Ragging:</b><br>
• Zero tolerance to ragging<br>
• Anti-Ragging Committee active<br>
• Report: antiragging@coetakola.ac.in<br>
• UGC Helpline: 1800-180-5522',

'<b>🔒 कैंपस सुरक्षा - COET अकोला</b><br>
• 24x7 सुरक्षा गार्ड मुख्य द्वार पर<br>
• पूरे कैंपस में CCTV<br>
• प्रवेश के लिए ID कार्ड अनिवार्य<br>
• रैगिंग पर पूर्ण प्रतिबंध<br>
• आपातकालीन संपर्क: 9960590202',

'<b>🔒 कॅम्पस सुरक्षा - COET अकोला</b><br>
• 24x7 सुरक्षा रक्षक मुख्य दरवाजावर<br>
• संपूर्ण कॅम्पसमध्ये CCTV<br>
• प्रवेशासाठी ID कार्ड बंधनकारक<br>
• रॅगिंगवर संपूर्ण बंदी<br>
• आपत्कालीन संपर्क: 9960590202',

NULL);

-- SCHOLARSHIP
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('scholarship', 'fees',
'<b>🎓 Scholarships - COET Akola</b><br><br>
<b>Available Scholarships:</b><br>
• <b>SC/ST Scholarship:</b> Full fee waiver (Govt. of Maharashtra)<br>
• <b>OBC/EBC Scholarship:</b> Partial fee concession<br>
• <b>EWS (Economically Weaker Section):</b> Available<br>
• <b>TFWS (Tuition Fee Waiver Scheme):</b> For Girls & Minority<br>
• <b>Central Sector Scholarship:</b> For 12th merit students<br>
• <b>Minority Scholarship:</b> For eligible minority students<br><br>
<b>How to Apply:</b><br>
• Apply via MahaDBT Portal: mahadbt.maharashtra.gov.in<br>
• Deadline: As per government notification<br>
<b>Contact:</b> Scholarship Cell, COET Akola | 9960590202',

'<b>🎓 छात्रवृत्ति - COET अकोला</b><br>
• SC/ST: पूर्ण शुल्क माफी<br>
• OBC/EBC: आंशिक शुल्क छूट<br>
• EWS: आर्थिक रूप से कमजोर वर्ग के लिए<br>
• TFWS: लड़कियों और अल्पसंख्यकों के लिए<br>
• केंद्रीय क्षेत्र छात्रवृत्ति: 12वीं मेरिट छात्रों के लिए<br>
<b>आवेदन:</b> MahaDBT पोर्टल पर करें<br>
<b>संपर्क:</b> 9960590202',

'<b>🎓 शिष्यवृत्ती - COET अकोला</b><br>
• SC/ST: संपूर्ण शुल्क माफी<br>
• OBC/EBC: आंशिक शुल्क सवलत<br>
• EWS: आर्थिकदृष्ट्या दुर्बल घटकांसाठी<br>
• TFWS: मुली व अल्पसंख्याकांसाठी<br>
• केंद्रीय क्षेत्र शिष्यवृत्ती: 12वी मेरिट विद्यार्थ्यांसाठी<br>
<b>अर्ज:</b> MahaDBT पोर्टलवर करा<br>
<b>संपर्क:</b> 9960590202',

NULL);

-- EXAM / RESULT
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('exam', 'academics',
'<b>📝 Examination - COET Akola</b><br><br>
<b>Exam Pattern (SGBAU):</b><br>
• Semester-wise exams (2 per year)<br>
• Internal Assessment: 20 Marks<br>
• University Exam: 80 Marks<br>
• Practical Exams: As per syllabus<br><br>
<b>Exam Schedule:</b> Published by SGBAU<br>
<b>Results:</b> Available on sgbau.ac.in<br><br>
<b>Important:</b><br>
• Min. 75% attendance required to appear in exam<br>
• Hall ticket issued by university<br>
<b>Contact:</b> Exam Cell, COET | 9960590202',

'<b>📝 परीक्षा - COET अकोला</b><br>
• सेमेस्टर-वार परीक्षाएं (प्रति वर्ष 2)<br>
• आंतरिक मूल्यांकन: 20 अंक<br>
• विश्वविद्यालय परीक्षा: 80 अंक<br>
• न्यूनतम 75% उपस्थिति अनिवार्य<br>
<b>परिणाम:</b> sgbau.ac.in पर उपलब्ध<br>
<b>संपर्क:</b> परीक्षा कक्ष, COET | 9960590202',

'<b>📝 परीक्षा - COET अकोला</b><br>
• सेमिस्टर-निहाय परीक्षा (वर्षाला 2)<br>
• अंतर्गत मूल्यमापन: 20 गुण<br>
• विद्यापीठ परीक्षा: 80 गुण<br>
• किमान 75% उपस्थिती बंधनकारक<br>
<b>निकाल:</b> sgbau.ac.in वर उपलब्ध<br>
<b>संपर्क:</b> परीक्षा कक्ष, COET | 9960590202',

NULL);

-- ATTENDANCE
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('attendance', 'academics',
'<b>📊 Attendance Policy - COET Akola</b><br><br>
<b>Minimum Required:</b> 75% attendance mandatory<br><br>
<b>Rules:</b><br>
• Students below 75% are NOT allowed to sit in exams<br>
• Medical leave must be supported by doctor certificate<br>
• Attendance is recorded for each subject separately<br>
• Parents will be informed for low attendance<br><br>
<b>How to Check:</b><br>
• Ask your class teacher or department office<br>
• Check notice board regularly<br>
<b>Contact:</b> Respective Department HOD | 9960590202',

'<b>📊 उपस्थिति नीति - COET अकोला</b><br>
<b>न्यूनतम:</b> 75% उपस्थिति अनिवार्य<br>
• 75% से कम उपस्थिति पर परीक्षा में बैठने की अनुमति नहीं<br>
• मेडिकल लीव के लिए डॉक्टर का प्रमाण पत्र जरूरी<br>
• कम उपस्थिति पर माता-पिता को सूचित किया जाएगा<br>
<b>संपर्क:</b> संबंधित विभाग HOD | 9960590202',

'<b>📊 उपस्थिती धोरण - COET अकोला</b><br>
<b>किमान:</b> 75% उपस्थिती बंधनकारक<br>
• 75% पेक्षा कमी उपस्थितीवर परीक्षेला बसण्यास परवानगी नाही<br>
• वैद्यकीय रजेसाठी डॉक्टरचे प्रमाणपत्र आवश्यक<br>
• कमी उपस्थितीवर पालकांना कळवले जाईल<br>
<b>संपर्क:</b> संबंधित विभाग HOD | 9960590202',

NULL);

-- SPORTS / EXTRACURRICULAR
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('sports', 'campus_info',
'<b>🏆 Sports & Extracurricular - COET Akola</b><br><br>
<b>Sports Facilities:</b><br>
• Cricket Ground<br>
• Volleyball Court<br>
• Basketball Court<br>
• Badminton Court<br>
• Indoor Games Room<br><br>
<b>Clubs & Activities:</b><br>
• NSS (National Service Scheme)<br>
• Cultural Events & Fests<br>
• Technical Competitions<br>
• Sports Tournaments (Inter-college)<br><br>
<b>Benefits:</b> Sports quota available for admissions<br>
<b>Contact:</b> Sports Department | 9960590202',

'<b>🏆 खेल और पाठ्येतर गतिविधियां - COET अकोला</b><br>
<b>खेल सुविधाएं:</b> क्रिकेट, वॉलीबॉल, बास्केटबॉल, बैडमिंटन, इनडोर गेम्स<br>
<b>क्लब:</b> NSS, सांस्कृतिक कार्यक्रम, तकनीकी प्रतियोगिताएं<br>
<b>लाभ:</b> प्रवेश में खेल कोटा उपलब्ध<br>
<b>संपर्क:</b> 9960590202',

'<b>🏆 क्रीडा व उपक्रम - COET अकोला</b><br>
<b>क्रीडा सुविधा:</b> क्रिकेट, व्हॉलीबॉल, बास्केटबॉल, बॅडमिंटन, इनडोर गेम्स<br>
<b>क्लब:</b> NSS, सांस्कृतिक कार्यक्रम, तांत्रिक स्पर्धा<br>
<b>फायदा:</b> प्रवेशात क्रीडा कोटा उपलब्ध<br>
<b>संपर्क:</b> 9960590202',

NULL);

-- NAAC / ACCREDITATION
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('naac', 'campus_info',
'<b>🏅 NAAC & Accreditation - COET Akola</b><br><br>
<b>NAAC Grade:</b> Accredited with Grade <b>"A"</b><br>
<b>Affiliated to:</b> Sant Gadge Baba Amravati University (SGBAU)<br>
<b>Approved by:</b> AICTE (All India Council for Technical Education)<br>
<b>Managed by:</b> Shri Shivaji Education Society, Amravati<br><br>
<b>Established:</b> COET Akola is a reputed engineering college in the Vidarbha region.<br>
<b>Recognition:</b> Recognized by Govt. of Maharashtra',

'<b>🏅 NAAC और मान्यता - COET अकोला</b><br>
<b>NAAC ग्रेड:</b> "A" ग्रेड मान्यता प्राप्त<br>
<b>सम्बद्ध:</b> SGBAU<br>
<b>अनुमोदित:</b> AICTE<br>
<b>प्रबंधित:</b> श्री शिवाजी शिक्षण संस्था, अमरावती<br>
<b>महाराष्ट्र सरकार द्वारा मान्यता प्राप्त</b>',

'<b>🏅 NAAC व मान्यता - COET अकोला</b><br>
<b>NAAC ग्रेड:</b> "A" ग्रेड मान्यता प्राप्त<br>
<b>संलग्न:</b> SGBAU<br>
<b>मंजूर:</b> AICTE<br>
<b>व्यवस्थापित:</b> श्री शिवाजी शिक्षण संस्था, अमरावती<br>
<b>महाराष्ट्र शासनाद्वारे मान्यताप्राप्त</b>',

NULL);

-- WIFI / INTERNET
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('wifi', 'campus_info',
'<b>📶 Wi-Fi & Internet - COET Akola</b><br><br>
<b>Wi-Fi Available:</b><br>
• Campus-wide Wi-Fi connectivity<br>
• Available in classrooms, labs, library & hostel<br>
• High-speed internet for students & staff<br><br>
<b>Computer Labs:</b><br>
• Well-equipped computer labs in all departments<br>
• Latest systems with updated software<br>
• Internet access available during college hours<br>
<b>Contact:</b> IT Department | 9960590202',

'<b>📶 Wi-Fi और इंटरनेट - COET अकोला</b><br>
• कैंपस में Wi-Fi उपलब्ध<br>
• कक्षाओं, लैब, पुस्तकालय और हॉस्टल में<br>
• हाई-स्पीड इंटरनेट<br>
<b>कंप्यूटर लैब:</b> सभी विभागों में उपलब्ध<br>
<b>संपर्क:</b> IT विभाग | 9960590202',

'<b>📶 Wi-Fi आणि इंटरनेट - COET अकोला</b><br>
• कॅम्पसमध्ये Wi-Fi उपलब्ध<br>
• वर्गखोल्या, लॅब, ग्रंथालय व वसतिगृहात<br>
• हाय-स्पीड इंटरनेट<br>
<b>संगणक लॅब:</b> सर्व विभागांमध्ये उपलब्ध<br>
<b>संपर्क:</b> IT विभाग | 9960590202',

NULL);

-- PARENT VISIT / MEETING
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('parent', 'campus_info',
'<b>👨‍👩‍👧 Parent Meet - COET Akola</b><br><br>
<b>Parent-Teacher Meeting:</b><br>
• Conducted every semester<br>
• Parents informed about ward''s performance & attendance<br>
• Grievances can be raised with HOD or Principal<br><br>
<b>Hostel Visiting Hours:</b><br>
• 6:00 PM – 8:00 PM (Weekdays)<br>
• Special permission for other times<br><br>
<b>Grievance Redressal:</b><br>
• Meet respective Class Teacher / HOD<br>
• Principal Office: Mon-Sat, 10 AM – 4 PM<br>
<b>Contact:</b> 9960590202',

'<b>👨‍👩‍👧 अभिभावक मिलन - COET अकोला</b><br>
• प्रत्येक सेमेस्टर में अभिभावक-शिक्षक बैठक<br>
• बच्चे की प्रगति और उपस्थिति की जानकारी<br>
<b>हॉस्टल मुलाकात:</b> शाम 6 – 8 बजे<br>
<b>शिकायत:</b> HOD या प्राचार्य से मिलें<br>
<b>संपर्क:</b> 9960590202',

'<b>👨‍👩‍👧 पालक भेट - COET अकोला</b><br>
• दर सेमिस्टरला पालक-शिक्षक बैठक<br>
• पाल्याची प्रगती व उपस्थितीची माहिती<br>
<b>वसतिगृह भेट:</b> सायंकाळी 6 – 8<br>
<b>तक्रार:</b> HOD किंवा प्राचार्यांना भेटा<br>
<b>संपर्क:</b> 9960590202',

NULL);

-- ID CARD
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('id card', 'campus_info',
'<b>🪪 ID Card - COET Akola</b><br><br>
<b>Student ID Card:</b><br>
• Issued at the time of admission<br>
• Mandatory for campus entry<br>
• Required for library, exams & all activities<br>
• Lost card: Apply at college office with fee<br><br>
<b>Staff ID Card:</b><br>
• Issued by HR/Admin department<br>
• Must be worn on campus at all times<br>
<b>Contact:</b> Admin Office | 9960590202',

'<b>🪪 आईडी कार्ड - COET अकोला</b><br>
• प्रवेश के समय जारी किया जाता है<br>
• कैंपस प्रवेश, पुस्तकालय व परीक्षा के लिए अनिवार्य<br>
• खोने पर: कॉलेज कार्यालय में शुल्क देकर आवेदन करें<br>
<b>संपर्क:</b> प्रशासन कार्यालय | 9960590202',

'<b>🪪 आयडी कार्ड - COET अकोला</b><br>
• प्रवेशाच्या वेळी दिले जाते<br>
• कॅम्पस प्रवेश, ग्रंथालय व परीक्षेसाठी बंधनकारक<br>
• हरवल्यास: कार्यालयात शुल्क भरून अर्ज करा<br>
<b>संपर्क:</b> प्रशासन कार्यालय | 9960590202',

NULL);

-- TIMING / COLLEGE HOURS
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('timing', 'campus_info',
'<b>⏰ College Timings - COET Akola</b><br><br>
<b>College Hours:</b> Monday to Saturday<br>
🕘 <b>Start:</b> 9:00 AM<br>
🕔 <b>End:</b> 5:00 PM<br><br>
<b>Office Hours:</b> 9:00 AM – 5:00 PM<br>
<b>Principal Office:</b> 10:00 AM – 4:00 PM<br>
<b>Library:</b> 9:00 AM – 5:00 PM<br>
<b>Canteen:</b> During college hours<br><br>
<b>Holidays:</b> Sundays & Govt. declared holidays<br>
<b>Contact:</b> 9960590202',

'<b>⏰ कॉलेज समय - COET अकोला</b><br>
<b>कॉलेज समय:</b> सोम-शनि, सुबह 9 – शाम 5<br>
<b>कार्यालय:</b> 9:00 AM – 5:00 PM<br>
<b>प्राचार्य कार्यालय:</b> 10:00 AM – 4:00 PM<br>
<b>पुस्तकालय:</b> 9:00 AM – 5:00 PM<br>
<b>छुट्टियां:</b> रविवार और सरकारी अवकाश<br>
<b>संपर्क:</b> 9960590202',

'<b>⏰ महाविद्यालय वेळ - COET अकोला</b><br>
<b>महाविद्यालय वेळ:</b> सोम-शनि, सकाळी 9 – सायंकाळी 5<br>
<b>कार्यालय:</b> 9:00 AM – 5:00 PM<br>
<b>प्राचार्य कार्यालय:</b> 10:00 AM – 4:00 PM<br>
<b>ग्रंथालय:</b> 9:00 AM – 5:00 PM<br>
<b>सुट्ट्या:</b> रविवार व शासकीय सुट्ट्या<br>
<b>संपर्क:</b> 9960590202',

NULL);

-- GRIEVANCE / COMPLAINT
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('grievance', 'campus_info',
'<b>📣 Grievance Redressal - COET Akola</b><br><br>
<b>Student/Parent Grievance:</b><br>
• Step 1: Contact Class Teacher<br>
• Step 2: Meet HOD of Department<br>
• Step 3: Visit Principal Office<br><br>
<b>Committees:</b><br>
• Anti-Ragging Committee<br>
• Women Grievance Cell<br>
• Student Welfare Committee<br>
• Internal Complaints Committee (ICC)<br><br>
<b>UGC Anti-Ragging Helpline:</b> 1800-180-5522<br>
<b>College Contact:</b> 9960590202<br>
<b>Office Hours:</b> Mon-Sat, 9 AM – 5 PM',

'<b>📣 शिकायत निवारण - COET अकोला</b><br>
• चरण 1: कक्षा शिक्षक से संपर्क<br>
• चरण 2: HOD से मिलें<br>
• चरण 3: प्राचार्य कार्यालय जाएं<br>
<b>समितियां:</b> एंटी-रैगिंग, महिला शिकायत, छात्र कल्याण<br>
<b>UGC हेल्पलाइन:</b> 1800-180-5522<br>
<b>संपर्क:</b> 9960590202',

'<b>📣 तक्रार निवारण - COET अकोला</b><br>
• पाऊल 1: वर्ग शिक्षकाशी संपर्क<br>
• पाऊल 2: HOD ला भेटा<br>
• पाऊल 3: प्राचार्य कार्यालयात जा<br>
<b>समित्या:</b> रॅगिंगविरोधी, महिला तक्रार, विद्यार्थी कल्याण<br>
<b>UGC हेल्पलाइन:</b> 1800-180-5522<br>
<b>संपर्क:</b> 9960590202',

NULL);

-- ============================================================
-- HINDI KEYWORD ALIASES FOR NEW QUESTIONS
-- ============================================================
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('छात्रवृत्ति', 'fees',
'<b>🎓 Scholarships Available at COET Akola</b><br>SC/ST, OBC/EBC, EWS, TFWS, Central Sector Scholarship.<br>Apply at MahaDBT Portal. Contact: 9960590202',
'<b>🎓 छात्रवृत्ति - COET अकोला</b><br>SC/ST: पूर्ण शुल्क माफी | OBC/EBC: आंशिक छूट | EWS, TFWS भी उपलब्ध<br>MahaDBT पोर्टल पर आवेदन करें। संपर्क: 9960590202',
'<b>🎓 शिष्यवृत्ती - COET अकोला</b><br>SC/ST: संपूर्ण शुल्क माफी | OBC/EBC: आंशिक सवलत | EWS, TFWS उपलब्ध<br>MahaDBT पोर्टलवर अर्ज करा. संपर्क: 9960590202',
NULL);

INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('परीक्षा', 'academics',
'<b>📝 Exam - COET Akola</b><br>Semester exams 2 per year. Internal: 20 marks, University: 80 marks. Min 75% attendance required. Results: sgbau.ac.in',
'<b>📝 परीक्षा - COET अकोला</b><br>प्रति वर्ष 2 सेमेस्टर परीक्षाएं। आंतरिक: 20 अंक, विश्वविद्यालय: 80 अंक। न्यूनतम 75% उपस्थिति जरूरी। परिणाम: sgbau.ac.in',
'<b>📝 परीक्षा - COET अकोला</b><br>वर्षाला 2 सेमिस्टर परीक्षा. अंतर्गत: 20 गुण, विद्यापीठ: 80 गुण. किमान 75% उपस्थिती आवश्यक. निकाल: sgbau.ac.in',
NULL);

INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('उपस्थिति', 'academics',
'<b>📊 Attendance - COET Akola</b><br>Minimum 75% attendance is mandatory to appear in exams. Low attendance will be reported to parents.',
'<b>📊 उपस्थिति - COET अकोला</b><br>परीक्षा में बैठने के लिए न्यूनतम 75% उपस्थिति अनिवार्य। कम उपस्थिति पर माता-पिता को सूचित किया जाएगा।',
'<b>📊 उपस्थिती - COET अकोला</b><br>परीक्षेसाठी किमान 75% उपस्थिती बंधनकारक. कमी उपस्थितीवर पालकांना कळवले जाईल.',
NULL);

INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('सुरक्षा', 'campus_info',
'<b>🔒 Campus Security - COET Akola</b><br>24x7 Security, CCTV, ID Card mandatory. Anti-Ragging: Zero tolerance. Helpline: 1800-180-5522',
'<b>🔒 सुरक्षा - COET अकोला</b><br>24x7 सुरक्षा गार्ड, CCTV, ID कार्ड अनिवार्य। रैगिंग पर शून्य सहिष्णुता। हेल्पलाइन: 1800-180-5522',
'<b>🔒 सुरक्षा - COET अकोला</b><br>24x7 सुरक्षा, CCTV, ID कार्ड बंधनकारक. रॅगिंगवर शून्य सहिष्णुता. हेल्पलाइन: 1800-180-5522',
NULL);

SELECT COUNT(*) AS total_keywords FROM chatbot;

-- ============================================================
-- INTERIOR DESIGN (D.ARCH) - LOCATION & DEPARTMENT INFO
-- ============================================================
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('interior', 'departments',
'<b>🏛️ Interior Design (D.Arch) - COET Akola</b><br><br>
<b>Course:</b> Diploma in Architecture (Interior Design)<br>
<b>Duration:</b> 3 Years<br>
<b>Seats:</b> 40<br><br>
<b>📍 Location:</b><br>
College of Engineering and Technology,<br>
Babhulgaon (Jh) N.H. No. 6, Akola – 444 104<br><br>
<b>Campus Block:</b> Architecture / Design Block, COET Campus<br><br>
<b>Fee:</b><br>
• Open: ₹47,454 per year<br>
• OBC/EBC: ₹27,000 per year<br>
• VJ/NT/TFWS: ₹6,545 per year<br>
• SC/ST: ₹2,454 per year<br><br>
<b>Eligibility:</b> 10th Pass (SSC)<br>
<b>Affiliated to:</b> MSBTE<br>
<b>📞 Contact:</b> 9960590202<br>
<b>🗺️ Google Maps:</b> Search "COET Akola"',

'<b>🏛️ इंटीरियर डिज़ाइन (D.Arch) - COET अकोला</b><br>
<b>कोर्स:</b> डिप्लोमा इन आर्किटेक्चर (इंटीरियर डिज़ाइन)<br>
<b>अवधि:</b> 3 साल | <b>सीटें:</b> 40<br><br>
<b>📍 स्थान:</b><br>
कॉलेज ऑफ इंजीनियरिंग एंड टेक्नोलॉजी,<br>
बाभुळगाव (झ) NH No. 6, अकोला – 444 104<br>
<b>कैंपस ब्लॉक:</b> आर्किटेक्चर / डिज़ाइन ब्लॉक<br><br>
<b>शुल्क:</b> Open: ₹47,454 | OBC: ₹27,000 | SC/ST: ₹2,454<br>
<b>पात्रता:</b> 10वीं पास | <b>संपर्क:</b> 9960590202',

'<b>🏛️ इंटेरियर डिझाईन (D.Arch) - COET अकोला</b><br>
<b>अभ्यासक्रम:</b> डिप्लोमा इन आर्किटेक्चर (इंटेरियर डिझाईन)<br>
<b>कालावधी:</b> 3 वर्षे | <b>जागा:</b> 40<br><br>
<b>📍 स्थान:</b><br>
कॉलेज ऑफ इंजिनिअरिंग अँड टेक्नॉलॉजी,<br>
बाभूळगाव (झ) NH No. 6, अकोला – 444 104<br>
<b>कॅम्पस ब्लॉक:</b> आर्किटेक्चर / डिझाईन ब्लॉक<br><br>
<b>शुल्क:</b> Open: ₹47,454 | OBC: ₹27,000 | SC/ST: ₹2,454<br>
<b>पात्रता:</b> 10वी उत्तीर्ण | <b>संपर्क:</b> 9960590202',

NULL);

-- Alias keywords
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('interior design', 'departments',
'<b>🏛️ Interior Design (D.Arch) - COET Akola</b><br>
<b>Duration:</b> 3 Years | <b>Seats:</b> 40<br>
<b>Eligibility:</b> 10th Pass<br>
<b>Fee (Open):</b> ₹47,454/year<br>
<b>📍 Location:</b> Architecture/Design Block, COET Campus,<br>Babhulgaon (Jh) NH No. 6, Akola – 444 104<br>
<b>📞 Contact:</b> 9960590202',
'<b>🏛️ इंटीरियर डिज़ाइन (D.Arch) - COET अकोला</b><br>
अवधि: 3 साल | सीटें: 40 | पात्रता: 10वीं पास<br>
शुल्क (Open): ₹47,454/वर्ष<br>
📍 स्थान: आर्किटेक्चर ब्लॉक, COET कैंपस, अकोला – 444 104<br>
📞 संपर्क: 9960590202',
'<b>🏛️ इंटेरियर डिझाईन (D.Arch) - COET अकोला</b><br>
कालावधी: 3 वर्षे | जागा: 40 | पात्रता: 10वी उत्तीर्ण<br>
शुल्क (Open): ₹47,454/वर्ष<br>
📍 स्थान: आर्किटेक्चर ब्लॉक, COET कॅम्पस, अकोला – 444 104<br>
📞 संपर्क: 9960590202',
NULL);

INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('d arch', 'departments',
'<b>🏛️ D.Arch (Interior Design) - COET Akola</b><br>
3 Year Diploma | 40 Seats | 10th Pass Eligible<br>
Fee: ₹47,454 (Open) | Affiliated: MSBTE<br>
📍 Architecture/Design Block, COET Campus, Akola – 444 104<br>
📞 9960590202',
'<b>🏛️ D.Arch (इंटीरियर डिज़ाइन) - COET अकोला</b><br>
3 साल डिप्लोमा | 40 सीटें | 10वीं पास<br>
शुल्क: ₹47,454 (Open) | MSBTE से संबद्ध<br>
📍 आर्किटेक्चर ब्लॉक, COET कैंपस, अकोला – 444 104<br>
📞 9960590202',
'<b>🏛️ D.Arch (इंटेरियर डिझाईन) - COET अकोला</b><br>
3 वर्षे डिप्लोमा | 40 जागा | 10वी उत्तीर्ण<br>
शुल्क: ₹47,454 (Open) | MSBTE संलग्न<br>
📍 आर्किटेक्चर ब्लॉक, COET कॅम्पस, अकोला – 444 104<br>
📞 9960590202',
NULL);

SELECT COUNT(*) AS total_keywords FROM chatbot;

-- ============================================================
-- STUDENT RESULT
-- ============================================================
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('result', 'academics',
'<b>📊 Student Result - COET Akola</b><br><br>
<b>How to Check Result:</b><br>
🌐 Visit: <a href="https://sgbau.ac.in" target="_blank">sgbau.ac.in</a><br><br>
<b>Steps:</b><br>
1️⃣ Go to sgbau.ac.in<br>
2️⃣ Click on "Examination" menu<br>
3️⃣ Select "Result"<br>
4️⃣ Enter your PRN / Roll Number<br>
5️⃣ Select Exam & Year<br>
6️⃣ View & Download your Result<br><br>
<b>Result Types:</b><br>
• Semester Result (Regular)<br>
• Backlog / ATKT Result<br>
• Revaluation Result<br><br>
<b>PRN Card / Hall Ticket:</b> Available from college office<br>
<b>Revaluation:</b> Apply within 15 days of result<br>
<b>📞 Contact:</b> Exam Cell, COET Akola | 9960590202',

'<b>📊 छात्र परिणाम - COET अकोला</b><br>
<b>परिणाम कैसे देखें:</b><br>
🌐 sgbau.ac.in पर जाएं<br>
1️⃣ "Examination" मेनू पर क्लिक करें<br>
2️⃣ "Result" चुनें<br>
3️⃣ PRN / रोल नंबर डालें<br>
4️⃣ परीक्षा और वर्ष चुनें<br>
5️⃣ परिणाम देखें और डाउनलोड करें<br><br>
<b>परिणाम प्रकार:</b> सेमेस्टर, बैकलॉग/ATKT, पुनर्मूल्यांकन<br>
<b>पुनर्मूल्यांकन:</b> परिणाम के 15 दिनों के भीतर आवेदन करें<br>
<b>📞 संपर्क:</b> परीक्षा कक्ष | 9960590202',

'<b>📊 विद्यार्थी निकाल - COET अकोला</b><br>
<b>निकाल कसा पाहायचा:</b><br>
🌐 sgbau.ac.in वर जा<br>
1️⃣ "Examination" मेनूवर क्लिक करा<br>
2️⃣ "Result" निवडा<br>
3️⃣ PRN / रोल नंबर टाका<br>
4️⃣ परीक्षा व वर्ष निवडा<br>
5️⃣ निकाल पाहा व डाउनलोड करा<br><br>
<b>निकाल प्रकार:</b> सेमिस्टर, बॅकलॉग/ATKT, पुनर्मूल्यांकन<br>
<b>पुनर्मूल्यांकन:</b> निकालाच्या 15 दिवसांत अर्ज करा<br>
<b>📞 संपर्क:</b> परीक्षा कक्ष | 9960590202',

NULL);

-- Hindi & Marathi keyword aliases
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('परिणाम', 'academics',
'<b>📊 Student Result - COET Akola</b><br>Check result at: sgbau.ac.in<br>Enter PRN/Roll Number → Select Exam → View Result<br>📞 Contact: Exam Cell | 9960590202',
'<b>📊 परिणाम - COET अकोला</b><br>परिणाम देखें: sgbau.ac.in पर<br>PRN/रोल नंबर डालें → परीक्षा चुनें → परिणाम देखें<br>📞 संपर्क: परीक्षा कक्ष | 9960590202',
'<b>📊 निकाल - COET अकोला</b><br>निकाल पाहा: sgbau.ac.in वर<br>PRN/रोल नंबर टाका → परीक्षा निवडा → निकाल पाहा<br>📞 संपर्क: परीक्षा कक्ष | 9960590202',
NULL);

INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('निकाल', 'academics',
'<b>📊 Student Result - COET Akola</b><br>Check result at: sgbau.ac.in<br>Enter PRN/Roll Number → Select Exam → View Result<br>📞 Contact: Exam Cell | 9960590202',
'<b>📊 परिणाम - COET अकोला</b><br>परिणाम देखें: sgbau.ac.in पर<br>PRN/रोल नंबर डालें → परीक्षा चुनें → परिणाम देखें<br>📞 संपर्क: परीक्षा कक्ष | 9960590202',
'<b>📊 निकाल - COET अकोला</b><br>निकाल पाहा: sgbau.ac.in वर<br>PRN/रोल नंबर टाका → परीक्षा निवडा → निकाल पाहा<br>📞 संपर्क: परीक्षा कक्ष | 9960590202',
NULL);

-- ATKT / Backlog keyword
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('atkt', 'academics',
'<b>📋 ATKT / Backlog - COET Akola</b><br><br>
<b>ATKT (Allowed To Keep Terms):</b><br>
• Students who fail in subjects can appear in next semester with backlog<br>
• ATKT Result available on: sgbau.ac.in<br><br>
<b>Backlog Exam:</b><br>
• Conducted along with regular semester exams<br>
• Apply for backlog exam at college exam cell<br>
• Fee applicable for each backlog subject<br><br>
<b>Revaluation / Photocopy:</b><br>
• Apply within 15 days of result declaration<br>
• Available at college exam cell<br>
<b>📞 Contact:</b> Exam Cell, COET | 9960590202',

'<b>📋 ATKT / बैकलॉग - COET अकोला</b><br>
• ATKT: अनुत्तीर्ण विषयों के साथ अगले सेमेस्टर में प्रवेश मिलता है<br>
• बैकलॉग परीक्षा नियमित सेमेस्टर के साथ होती है<br>
• परिणाम: sgbau.ac.in पर<br>
• पुनर्मूल्यांकन: परिणाम के 15 दिनों के भीतर आवेदन करें<br>
<b>📞 संपर्क:</b> परीक्षा कक्ष | 9960590202',

'<b>📋 ATKT / बॅकलॉग - COET अकोला</b><br>
• ATKT: नापास विषयांसह पुढील सेमिस्टरला प्रवेश मिळतो<br>
• बॅकलॉग परीक्षा नियमित सेमिस्टरसोबत होते<br>
• निकाल: sgbau.ac.in वर<br>
• पुनर्मूल्यांकन: निकालाच्या 15 दिवसांत अर्ज करा<br>
<b>📞 संपर्क:</b> परीक्षा कक्ष | 9960590202',

NULL);

SELECT COUNT(*) AS total_keywords FROM chatbot;

-- ============================================================
-- SMART DETAILED Q&A - LIKE AI CHATBOT BEHAVIOR
-- All common ways students/parents/staff ask questions
-- ============================================================

-- ============================================================
-- ADMISSION RELATED - ALL WAYS PEOPLE ASK
-- ============================================================
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('how to take admission', 'admission',
'<b>📋 How to Take Admission - COET Akola</b><br><br>
<b>Step-by-Step Admission Process:</b><br>
1️⃣ Appear in MHT-CET / JEE Mains exam<br>
2️⃣ Register on DTE Maharashtra portal: dtemaharashtra.gov.in<br>
3️⃣ Fill CAP (Centralized Admission Process) form<br>
4️⃣ Upload documents online<br>
5️⃣ Attend CAP rounds for allotment<br>
6️⃣ Report to COET Akola with original documents<br>
7️⃣ Pay fees and confirm admission<br><br>
<b>Documents Required:</b><br>
• 10th & 12th Marksheet + Passing Certificate<br>
• School/College Leaving Certificate<br>
• Aadhar Card (Student + Parent)<br>
• Caste Certificate (if applicable)<br>
• Non-Creamy Layer Certificate (OBC)<br>
• Passport Size Photos (6 copies)<br>
• Migration Certificate (if from other board)<br><br>
<b>Helpline:</b> 9960590202 | Mon-Sat 9AM-5PM',

'<b>📋 प्रवेश कैसे लें - COET अकोला</b><br>
<b>चरण-दर-चरण प्रक्रिया:</b><br>
1️⃣ MHT-CET / JEE Mains परीक्षा दें<br>
2️⃣ DTE Maharashtra पोर्टल पर पंजीकरण करें<br>
3️⃣ CAP फॉर्म भरें<br>
4️⃣ दस्तावेज़ अपलोड करें<br>
5️⃣ CAP राउंड में भाग लें<br>
6️⃣ मूल दस्तावेजों के साथ COET अकोला आएं<br>
7️⃣ शुल्क जमा करें और प्रवेश की पुष्टि करें<br><br>
<b>आवश्यक दस्तावेज़:</b> 10वीं/12वीं मार्कशीट, LC, आधार, जाति प्रमाण पत्र, फोटो<br>
<b>हेल्पलाइन:</b> 9960590202',

'<b>📋 प्रवेश कसा घ्यायचा - COET अकोला</b><br>
<b>टप्प्याटप्प्याने प्रक्रिया:</b><br>
1️⃣ MHT-CET / JEE Mains परीक्षा द्या<br>
2️⃣ DTE Maharashtra पोर्टलवर नोंदणी करा<br>
3️⃣ CAP फॉर्म भरा<br>
4️⃣ कागदपत्रे अपलोड करा<br>
5️⃣ CAP फेरीत भाग घ्या<br>
6️⃣ मूळ कागदपत्रांसह COET अकोलाला या<br>
7️⃣ शुल्क भरा आणि प्रवेश निश्चित करा<br><br>
<b>आवश्यक कागदपत्रे:</b> 10वी/12वी गुणपत्रिका, LC, आधार, जात प्रमाणपत्र, फोटो<br>
<b>हेल्पलाइन:</b> 9960590202',
NULL);

-- Aliases for admission questions
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES ('admission process', 'admission', '<b>📋 Admission Process - COET Akola</b><br>MHT-CET/JEE → DTE Portal Registration → CAP Round → Document Verification → Fee Payment<br><b>Eligibility:</b> 12th PCM 45% (40% reserved)<br><b>Contact:</b> 9960590202', '<b>📋 प्रवेश प्रक्रिया</b><br>MHT-CET/JEE → DTE पोर्टल → CAP राउंड → दस्तावेज़ सत्यापन → शुल्क भुगतान<br><b>संपर्क:</b> 9960590202', '<b>📋 प्रवेश प्रक्रिया</b><br>MHT-CET/JEE → DTE पोर्टल → CAP फेरी → कागदपत्र तपासणी → शुल्क भरणा<br><b>संपर्क:</b> 9960590202', NULL);

INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES ('eligibility', 'admission', '<b>✅ Eligibility - COET Akola</b><br><br><b>B.E./B.Tech:</b> 12th PCM minimum 45% (40% for SC/ST/OBC)<br><b>B.Arch:</b> 12th with Maths + NATA score<br><b>MBA:</b> Any graduation with 50% marks<br><b>M.E./M.Tech:</b> B.E./B.Tech with 50% marks<br><b>D.Arch (Diploma):</b> 10th Pass (SSC)<br><br><b>Entrance Exams:</b><br>• B.E. → MHT-CET / JEE Mains<br>• B.Arch → MHT-CET / NATA<br>• MBA → MAT / CAT / MH-CET<br><b>Contact:</b> 9960590202', '<b>✅ पात्रता - COET अकोला</b><br>• बी.ई.: 12वीं PCM 45% (SC/ST: 40%)<br>• बी.आर्क: 12वीं गणित + NATA<br>• MBA: स्नातक 50%<br>• M.E./M.Tech: बी.ई. 50%<br>• D.Arch: 10वीं पास<br><b>संपर्क:</b> 9960590202', '<b>✅ पात्रता - COET अकोला</b><br>• बी.ई.: 12वी PCM 45% (SC/ST: 40%)<br>• बी.आर्क: 12वी गणित + NATA<br>• MBA: पदवी 50%<br>• M.E./M.Tech: बी.ई. 50%<br>• D.Arch: 10वी उत्तीर्ण<br><b>संपर्क:</b> 9960590202', NULL);

INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES ('documents', 'admission', '<b>📄 Documents Required - COET Akola</b><br><br>• 10th Marksheet & Passing Certificate<br>• 12th Marksheet & Passing Certificate<br>• School/College Leaving Certificate (LC)<br>• Aadhar Card (Student + Parent)<br>• Caste Certificate (SC/ST/OBC - if applicable)<br>• Non-Creamy Layer Certificate (OBC)<br>• Domicile / Nationality Certificate<br>• Passport Size Photos (6 copies)<br>• Migration Certificate (other board students)<br>• Gap Certificate (if applicable)<br>• Medical Fitness Certificate<br><br><b>Note:</b> Carry originals + 2 sets of photocopies<br><b>Contact:</b> 9960590202', '<b>📄 आवश्यक दस्तावेज़ - COET अकोला</b><br>• 10वीं/12वीं मार्कशीट व उत्तीर्ण प्रमाण पत्र<br>• LC (लिविंग सर्टिफिकेट)<br>• आधार कार्ड<br>• जाति प्रमाण पत्र (यदि लागू हो)<br>• नॉन-क्रीमी लेयर सर्टिफिकेट (OBC)<br>• पासपोर्ट साइज फोटो (6)<br>• माइग्रेशन सर्टिफिकेट (अन्य बोर्ड)<br><b>संपर्क:</b> 9960590202', '<b>📄 आवश्यक कागदपत्रे - COET अकोला</b><br>• 10वी/12वी गुणपत्रिका व उत्तीर्ण दाखला<br>• LC (शाळा सोडल्याचा दाखला)<br>• आधार कार्ड<br>• जात प्रमाणपत्र (लागू असल्यास)<br>• नॉन-क्रीमी लेयर (OBC)<br>• पासपोर्ट फोटो (6)<br>• स्थलांतर दाखला (इतर बोर्ड)<br><b>संपर्क:</b> 9960590202', NULL);

-- ============================================================
-- FEE RELATED SMART QUESTIONS
-- ============================================================
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('fee payment', 'fees',
'<b>💳 Fee Payment - COET Akola</b><br><br>
<b>Payment Modes:</b><br>
• Online Payment (Net Banking / UPI / Debit Card)<br>
• DD (Demand Draft) in favour of "Principal, COET Akola"<br>
• Cash payment at college account office<br><br>
<b>Fee Receipt:</b><br>
• Always collect fee receipt after payment<br>
• Keep it safe for scholarship & records<br><br>
<b>Scholarship Deduction:</b><br>
• SC/ST students: Government pays directly<br>
• OBC/EBC: Partial deduction after verification<br><br>
<b>Account Office Hours:</b> Mon-Sat, 9AM – 4PM<br>
<b>Contact:</b> 9960590202',

'<b>💳 शुल्क भुगतान - COET अकोला</b><br>
<b>भुगतान के तरीके:</b><br>
• ऑनलाइन (Net Banking / UPI / Debit Card)<br>
• DD: "Principal, COET Akola" के नाम<br>
• नकद: कॉलेज खाता कार्यालय में<br><br>
<b>छात्रवृत्ति:</b> SC/ST: सरकार सीधे भुगतान करती है | OBC: आंशिक कटौती<br>
<b>कार्यालय समय:</b> सोम-शनि, 9AM-4PM | <b>संपर्क:</b> 9960590202',

'<b>💳 शुल्क भरणा - COET अकोला</b><br>
<b>भरण्याचे मार्ग:</b><br>
• ऑनलाइन (Net Banking / UPI / Debit Card)<br>
• DD: "Principal, COET Akola" च्या नावे<br>
• रोख: महाविद्यालय लेखा कार्यालयात<br><br>
<b>शिष्यवृत्ती:</b> SC/ST: शासन थेट भरते | OBC: आंशिक कपात<br>
<b>कार्यालय वेळ:</b> सोम-शनि, 9AM-4PM | <b>संपर्क:</b> 9960590202',
NULL);

INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES ('fees structure', 'fees', '<b>💰 Fee Structure 2025-2026 - COET Akola</b><br><br><b>U.G. Courses:</b><br>• B.E. First Year (Open): ₹1,20,531 | OBC: ₹69,439 | SC/ST: ₹3,531<br>• B.Arch First Year (Open): ₹1,19,264 | OBC: ₹67,937<br>• B.E. Direct 2nd Year (Open): ₹1,09,284<br><br><b>P.G. Courses:</b><br>• MBA (Open): ₹1,01,864 | OBC: ₹56,410<br>• M.E./M.Tech: ₹1,00,444 | SC/ST: ₹2,444<br><br><b>Diploma:</b><br>• D.Arch (Open): ₹47,454 | OBC: ₹27,000 | SC/ST: ₹2,454<br><br><b>Scholarships available for SC/ST, OBC, EWS & Girls (TFWS)</b><br><b>Contact:</b> 9960590202', '<b>💰 शुल्क संरचना 2025-26</b><br>• बी.ई. (Open): ₹1,20,531 | OBC: ₹69,439 | SC/ST: ₹3,531<br>• MBA (Open): ₹1,01,864<br>• M.E./M.Tech: ₹1,00,444<br>• D.Arch (Open): ₹47,454<br><b>संपर्क:</b> 9960590202', '<b>💰 शुल्क रचना 2025-26</b><br>• बी.ई. (Open): ₹1,20,531 | OBC: ₹69,439 | SC/ST: ₹3,531<br>• MBA (Open): ₹1,01,864<br>• M.E./M.Tech: ₹1,00,444<br>• D.Arch (Open): ₹47,454<br><b>संपर्क:</b> 9960590202', NULL);

INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES ('kitna fee hai', 'fees', '<b>💰 Fee Structure 2025-2026 - COET Akola</b><br><br>• B.E. First Year (Open): ₹1,20,531 | OBC: ₹69,439 | SC/ST: ₹3,531<br>• B.Arch (Open): ₹1,19,264<br>• MBA (Open): ₹1,01,864<br>• M.E./M.Tech: ₹1,00,444<br>• D.Arch Diploma (Open): ₹47,454<br><br><b>Scholarships:</b> SC/ST, OBC, EWS, TFWS available<br><b>Contact:</b> 9960590202', '<b>💰 कितनी फीस है - COET अकोला</b><br>• बी.ई. (Open): ₹1,20,531 | OBC: ₹69,439 | SC/ST: ₹3,531<br>• MBA: ₹1,01,864 | M.E.: ₹1,00,444 | D.Arch: ₹47,454<br><b>छात्रवृत्ति उपलब्ध। संपर्क:</b> 9960590202', '<b>💰 किती फी आहे - COET अकोला</b><br>• बी.ई. (Open): ₹1,20,531 | OBC: ₹69,439 | SC/ST: ₹3,531<br>• MBA: ₹1,01,864 | M.E.: ₹1,00,444 | D.Arch: ₹47,454<br><b>शिष्यवृत्ती उपलब्ध. संपर्क:</b> 9960590202', NULL);

-- ============================================================
-- RESULT DETAILED SMART QUESTIONS
-- ============================================================
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('how to check result', 'academics',
'<b>📊 How to Check Result - COET Akola</b><br><br>
<b>Method 1 - SGBAU Website:</b><br>
1️⃣ Go to: <b>sgbau.ac.in</b><br>
2️⃣ Click "Examination" → "Result"<br>
3️⃣ Enter PRN Number & Select Semester<br>
4️⃣ Click Submit → View & Download Result<br><br>
<b>Method 2 - DigiLocker:</b><br>
1️⃣ Open DigiLocker App<br>
2️⃣ Search "SGBAU"<br>
3️⃣ Enter Roll Number & DOB<br>
4️⃣ Download official marksheet<br><br>
<b>PRN Number:</b> Available on your Hall Ticket / College ID<br>
<b>Result Not Showing?</b> Contact Exam Cell: 9960590202<br>
<b>Revaluation:</b> Apply within 15 days of result at college office',

'<b>📊 परिणाम कैसे देखें - COET अकोला</b><br>
<b>तरीका 1 - SGBAU वेबसाइट:</b><br>
1️⃣ sgbau.ac.in पर जाएं<br>
2️⃣ "Examination" → "Result" पर क्लिक करें<br>
3️⃣ PRN नंबर और सेमेस्टर चुनें<br>
4️⃣ Submit करें और परिणाम डाउनलोड करें<br><br>
<b>तरीका 2 - DigiLocker:</b> DigiLocker App → SGBAU → रोल नंबर व DOB डालें<br>
<b>PRN:</b> हॉल टिकट या ID कार्ड पर मिलेगा<br>
<b>संपर्क:</b> परीक्षा कक्ष | 9960590202',

'<b>📊 निकाल कसा पाहायचा - COET अकोला</b><br>
<b>पद्धत 1 - SGBAU वेबसाइट:</b><br>
1️⃣ sgbau.ac.in वर जा<br>
2️⃣ "Examination" → "Result" वर क्लिक करा<br>
3️⃣ PRN नंबर व सेमिस्टर निवडा<br>
4️⃣ Submit करा व निकाल डाउनलोड करा<br><br>
<b>पद्धत 2 - DigiLocker:</b> DigiLocker App → SGBAU → रोल नंबर व DOB टाका<br>
<b>PRN:</b> हॉल तिकीट किंवा ID कार्डवर मिळेल<br>
<b>संपर्क:</b> परीक्षा कक्ष | 9960590202',
NULL);

INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES ('revaluation', 'academics', '<b>📝 Revaluation - COET Akola</b><br><br><b>Revaluation Process:</b><br>• Apply within 15 days of result declaration<br>• Fill revaluation form at college exam cell<br>• Pay revaluation fee (as per SGBAU)<br>• Result declared within 30-45 days<br><br><b>Photocopy of Answer Sheet:</b><br>• Apply for photocopy before revaluation<br>• Helps to verify marks<br><br><b>Note:</b> Revaluation is only for university exam (80 marks paper)<br><b>Contact:</b> Exam Cell, COET Akola | 9960590202', '<b>📝 पुनर्मूल्यांकन - COET अकोला</b><br>• परिणाम के 15 दिनों के भीतर आवेदन करें<br>• परीक्षा कक्ष में फॉर्म भरें और शुल्क जमा करें<br>• परिणाम 30-45 दिनों में घोषित होगा<br>• उत्तर पुस्तिका की फोटोकॉपी पहले लें<br><b>संपर्क:</b> 9960590202', '<b>📝 पुनर्मूल्यांकन - COET अकोला</b><br>• निकालाच्या 15 दिवसांत अर्ज करा<br>• परीक्षा कक्षात फॉर्म भरा व शुल्क भरा<br>• निकाल 30-45 दिवसांत जाहीर होईल<br>• उत्तरपत्रिकेची झेरॉक्स आधी घ्या<br><b>संपर्क:</b> 9960590202', NULL);

INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES ('marksheet', 'academics', '<b>📄 Marksheet - COET Akola</b><br><br><b>Original Marksheet:</b><br>• Issued by SGBAU after result declaration<br>• Collected from college exam cell<br>• Usually available 1-2 months after result<br><br><b>Provisional Marksheet:</b><br>• Available immediately after result on sgbau.ac.in<br>• Print from DigiLocker (accepted officially)<br><br><b>Duplicate Marksheet:</b><br>• Apply at SGBAU office with affidavit & fee<br>• Contact SGBAU: sgbau.ac.in<br><br><b>College Contact:</b> Exam Cell | 9960590202', '<b>📄 मार्कशीट - COET अकोला</b><br>• मूल मार्कशीट: परिणाम के 1-2 महीने बाद SGBAU द्वारा<br>• अनंतिम: sgbau.ac.in या DigiLocker पर तुरंत<br>• डुप्लीकेट: SGBAU कार्यालय में हलफनामा + शुल्क<br><b>संपर्क:</b> परीक्षा कक्ष | 9960590202', '<b>📄 गुणपत्रिका - COET अकोला</b><br>• मूळ गुणपत्रिका: निकालानंतर 1-2 महिन्यांनी SGBAU कडून<br>• तात्पुरती: sgbau.ac.in किंवा DigiLocker वर लगेच<br>• डुप्लीकेट: SGBAU कार्यालयात प्रतिज्ञापत्र + शुल्क<br><b>संपर्क:</b> परीक्षा कक्ष | 9960590202', NULL);

-- ============================================================
-- HOSTEL SMART QUESTIONS
-- ============================================================
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('hostel admission', 'hostel',
'<b>🏠 Hostel Admission - COET Akola</b><br><br>
<b>Who Can Apply:</b><br>
• Girls students of COET Akola only<br>
• Priority given to outstation students<br><br>
<b>How to Apply:</b><br>
1️⃣ Contact Hostel Warden / Admin Office<br>
2️⃣ Fill Hostel Application Form<br>
3️⃣ Submit with college ID, parent ID, photos<br>
4️⃣ Pay hostel fee: ₹24,000/year (approx)<br><br>
<b>Documents for Hostel:</b><br>
• College Admission Proof<br>
• Aadhar Card (Student + Parent)<br>
• 2 Passport Size Photos<br>
• Parent Contact Details<br><br>
<b>Hostel Warden:</b> Available 24x7<br>
<b>Contact:</b> 9960590202',

'<b>🏠 हॉस्टल प्रवेश - COET अकोला</b><br>
<b>कौन आवेदन कर सकता है:</b> COET की छात्राएं (बाहरी जिले को प्राथमिकता)<br>
<b>कैसे आवेदन करें:</b><br>
1️⃣ हॉस्टल वार्डन/प्रशासन कार्यालय से संपर्क करें<br>
2️⃣ आवेदन फॉर्म भरें<br>
3️⃣ ID, फोटो जमा करें<br>
4️⃣ शुल्क जमा करें: ₹24,000/वर्ष (लगभग)<br>
<b>संपर्क:</b> 9960590202',

'<b>🏠 वसतिगृह प्रवेश - COET अकोला</b><br>
<b>कोण अर्ज करू शकतो:</b> COET च्या मुली (बाहेरगावच्यांना प्राधान्य)<br>
<b>कसा अर्ज करायचा:</b><br>
1️⃣ वसतिगृह वॉर्डन/प्रशासन कार्यालयाशी संपर्क करा<br>
2️⃣ अर्ज फॉर्म भरा<br>
3️⃣ ID, फोटो जमा करा<br>
4️⃣ शुल्क भरा: ₹24,000/वर्ष (अंदाजे)<br>
<b>संपर्क:</b> 9960590202',
NULL);

INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES ('hostel fee', 'hostel', '<b>🏠 Hostel Fee - COET Akola</b><br><br><b>Annual Hostel Fee:</b> ₹24,000 (Approx.)<br><br><b>Fee Includes:</b><br>• Room Rent<br>• Mess Charges (3 meals/day)<br>• Water & Electricity<br>• Wi-Fi Access<br>• Study Room<br><br><b>Payment:</b> Paid at time of hostel admission<br><b>Contact:</b> Hostel Warden / Admin | 9960590202', '<b>🏠 हॉस्टल शुल्क - COET अकोला</b><br><b>वार्षिक शुल्क:</b> ₹24,000 (लगभग)<br><b>शामिल:</b> कमरा किराया, मेस (3 भोजन/दिन), पानी, बिजली, Wi-Fi, अध्ययन कक्ष<br><b>संपर्क:</b> 9960590202', '<b>🏠 वसतिगृह शुल्क - COET अकोला</b><br><b>वार्षिक शुल्क:</b> ₹24,000 (अंदाजे)<br><b>समाविष्ट:</b> खोली भाडे, मेस (3 जेवण/दिवस), पाणी, वीज, Wi-Fi, अभ्यास कक्ष<br><b>संपर्क:</b> 9960590202', NULL);

INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES ('hostel rules', 'hostel', '<b>🏠 Hostel Rules - COET Akola</b><br><br><b>Important Rules:</b><br>• Return to hostel by 8:30 PM mandatory<br>• Parents visiting hours: 6:00 PM – 8:00 PM only<br>• No male visitors allowed inside hostel<br>• Zero tolerance for ragging<br>• Mobile phones allowed (responsible use)<br>• Cleanliness of room mandatory<br>• Warden permission required for overnight absence<br>• No cooking in rooms<br>• Mess timings to be followed strictly<br><br><b>Violation:</b> May lead to hostel expulsion<br><b>Contact:</b> Hostel Warden 24x7 | 9960590202', '<b>🏠 हॉस्टल नियम - COET अकोला</b><br>• रात 8:30 बजे तक वापस आना अनिवार्य<br>• माता-पिता मुलाकात: शाम 6-8 बजे<br>• पुरुष आगंतुकों को प्रवेश नहीं<br>• रैगिंग पर शून्य सहिष्णुता<br>• रात को बाहर रहने के लिए वार्डन की अनुमति<br>• कमरे में खाना पकाना मना<br><b>संपर्क:</b> वार्डन 24x7 | 9960590202', '<b>🏠 वसतिगृह नियम - COET अकोला</b><br>• रात्री 8:30 पर्यंत परतणे बंधनकारक<br>• पालक भेट: सायंकाळी 6-8<br>• पुरुष पाहुण्यांना प्रवेश नाही<br>• रॅगिंगवर शून्य सहिष्णुता<br>• रात्री बाहेर राहण्यासाठी वॉर्डन परवानगी<br>• खोलीत स्वयंपाक करण्यास मनाई<br><b>संपर्क:</b> वॉर्डन 24x7 | 9960590202', NULL);

-- ============================================================
-- PLACEMENT SMART QUESTIONS
-- ============================================================
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('placement process', 'placement',
'<b>💼 Placement Process - COET Akola</b><br><br>
<b>How Placement Works:</b><br>
1️⃣ Register with Placement Cell (Final Year students)<br>
2️⃣ Attend Pre-Placement Training (Aptitude + Technical + HR)<br>
3️⃣ Company visits campus for recruitment drive<br>
4️⃣ Appear in Written Test / Aptitude Round<br>
5️⃣ Group Discussion (GD)<br>
6️⃣ Technical Interview<br>
7️⃣ HR Interview<br>
8️⃣ Offer Letter issued<br><br>
<b>Placement Head:</b> Dr. Agrawal Sir<br>
<b>Internship Head:</b> Prof. K. Barabde Mam<br>
<b>Top Recruiters:</b> TCS, Wipro, Capgemini & more<br>
<b>Average Package:</b> ₹2-3 LPA<br>
<b>Contact:</b> Placement Cell | 9960590202',

'<b>💼 प्लेसमेंट प्रक्रिया - COET अकोला</b><br>
1️⃣ प्लेसमेंट सेल में पंजीकरण<br>
2️⃣ प्री-प्लेसमेंट ट्रेनिंग (Aptitude + Technical + HR)<br>
3️⃣ कंपनी का कैंपस दौरा<br>
4️⃣ लिखित परीक्षा → GD → तकनीकी साक्षात्कार → HR साक्षात्कार<br>
5️⃣ ऑफर लेटर<br>
<b>औसत पैकेज:</b> ₹2-3 LPA | <b>संपर्क:</b> 9960590202',

'<b>💼 प्लेसमेंट प्रक्रिया - COET अकोला</b><br>
1️⃣ प्लेसमेंट सेलमध्ये नोंदणी<br>
2️⃣ प्री-प्लेसमेंट प्रशिक्षण (Aptitude + Technical + HR)<br>
3️⃣ कंपनीचा कॅम्पस दौरा<br>
4️⃣ लेखी परीक्षा → GD → तांत्रिक मुलाखत → HR मुलाखत<br>
5️⃣ ऑफर लेटर<br>
<b>सरासरी पॅकेज:</b> ₹2-3 LPA | <b>संपर्क:</b> 9960590202',
NULL);

INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES ('internship', 'placement', '<b>🏢 Internship - COET Akola</b><br><br><b>Internship Opportunities:</b><br>• Regular internship opportunities arranged by college<br>• Available for 3rd & 4th year students<br>• Duration: 1 month to 6 months<br>• Both paid and unpaid internships<br><br><b>How to Get Internship:</b><br>• Contact Internship Head: Prof. K. Barabde Mam<br>• Apply through placement cell<br>• Self-apply on LinkedIn, Internshala, Naukri<br><br><b>Top Internship Companies:</b> TCS, Wipro, Capgemini & local IT companies<br><b>Contact:</b> Placement Cell | 9960590202', '<b>🏢 इंटर्नशिप - COET अकोला</b><br>• 3rd और 4th साल के छात्रों के लिए<br>• अवधि: 1-6 महीने<br>• सशुल्क और निःशुल्क दोनों<br><b>इंटर्नशिप प्रमुख:</b> Prof. K. Barabde Mam<br><b>संपर्क:</b> प्लेसमेंट सेल | 9960590202', '<b>🏢 इंटर्नशिप - COET अकोला</b><br>• 3rd व 4th वर्षाच्या विद्यार्थ्यांसाठी<br>• कालावधी: 1-6 महिने<br>• सशुल्क व निःशुल्क दोन्ही<br><b>इंटर्नशिप प्रमुख:</b> Prof. K. Barabde Mam<br><b>संपर्क:</b> प्लेसमेंट सेल | 9960590202', NULL);

-- ============================================================
-- GENERAL COLLEGE SMART QUESTIONS
-- ============================================================
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES
('about college', 'campus_info',
'<b>🏛️ About COET Akola</b><br><br>
<b>College of Engineering and Technology, Akola</b><br>
Managed by: Shri Shivaji Education Society, Amravati<br><br>
<b>Key Facts:</b><br>
• <b>Established:</b> One of the leading engineering colleges in Vidarbha<br>
• <b>NAAC Grade:</b> "A" Accredited<br>
• <b>Affiliated to:</b> Sant Gadge Baba Amravati University (SGBAU)<br>
• <b>Approved by:</b> AICTE<br>
• <b>Location:</b> Babhulgaon (Jh) NH No. 6, Akola – 444 104<br><br>
<b>Courses:</b> B.E., B.Arch, MBA, M.E., M.Tech, D.Arch<br>
<b>Total Seats:</b> 616+ (UG + PG + Diploma)<br>
<b>Principal:</b> Dr. P.V. Thorat | 📞 9960590202',

'<b>🏛️ COET अकोला के बारे में</b><br>
<b>कॉलेज ऑफ इंजीनियरिंग एंड टेक्नोलॉजी, अकोला</b><br>
प्रबंधन: श्री शिवाजी शिक्षण संस्था, अमरावती<br>
• NAAC ग्रेड: "A"<br>
• सम्बद्ध: SGBAU | अनुमोदित: AICTE<br>
• स्थान: बाभुळगाव (झ) NH No. 6, अकोला – 444 104<br>
• कोर्स: B.E., B.Arch, MBA, M.E., M.Tech, D.Arch<br>
<b>प्राचार्य:</b> Dr. P.V. Thorat | 📞 9960590202',

'<b>🏛️ COET अकोला बद्दल</b><br>
<b>कॉलेज ऑफ इंजिनिअरिंग अँड टेक्नॉलॉजी, अकोला</b><br>
व्यवस्थापन: श्री शिवाजी शिक्षण संस्था, अमरावती<br>
• NAAC ग्रेड: "A"<br>
• संलग्न: SGBAU | मंजूर: AICTE<br>
• स्थान: बाभूळगाव (झ) NH No. 6, अकोला – 444 104<br>
• अभ्यासक्रम: B.E., B.Arch, MBA, M.E., M.Tech, D.Arch<br>
<b>प्राचार्य:</b> Dr. P.V. Thorat | 📞 9960590202',
NULL);

INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES ('college information', 'campus_info', '<b>🏛️ COET Akola - College Information</b><br>College of Engineering and Technology, Akola<br>Managed by Shri Shivaji Education Society, Amravati<br>NAAC "A" Grade | AICTE Approved | SGBAU Affiliated<br>Principal: Dr. P.V. Thorat | 📞 9960590202<br>Address: Babhulgaon NH No.6, Akola – 444 104', '<b>🏛️ COET अकोला जानकारी</b><br>NAAC "A" | AICTE | SGBAU | श्री शिवाजी शिक्षण संस्था<br>प्राचार्य: Dr. P.V. Thorat | 📞 9960590202<br>पता: बाभुळगाव NH No.6, अकोला – 444 104', '<b>🏛️ COET अकोला माहिती</b><br>NAAC "A" | AICTE | SGBAU | श्री शिवाजी शिक्षण संस्था<br>प्राचार्य: Dr. P.V. Thorat | 📞 9960590202<br>पत्ता: बाभूळगाव NH No.6, अकोला – 444 104', NULL);

INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES ('facilities', 'campus_info', '<b>🏫 Campus Facilities - COET Akola</b><br><br>• 📖 Central Library (12,623 titles, 40,514 volumes)<br>• 💻 Well-equipped Computer Labs<br>• 🔬 Science & Engineering Labs<br>• 🏠 Girls Hostel (on campus)<br>• 🍽️ Canteen<br>• 🚌 College Bus Facility<br>• 📶 Campus-wide Wi-Fi<br>• 🏟️ Sports Ground (Cricket, Volleyball, Basketball, Badminton)<br>• 🏥 Medical Facility<br>• 🎭 Seminar Hall & Auditorium<br>• 🔒 24x7 CCTV Security<br><br><b>Contact:</b> 9960590202', '<b>🏫 कैंपस सुविधाएं - COET अकोला</b><br>• केंद्रीय पुस्तकालय<br>• कंप्यूटर लैब<br>• गर्ल्स हॉस्टल<br>• कैंटीन<br>• कॉलेज बस<br>• Wi-Fi<br>• खेल मैदान<br>• सेमिनार हॉल<br>• 24x7 CCTV<br><b>संपर्क:</b> 9960590202', '<b>🏫 कॅम्पस सुविधा - COET अकोला</b><br>• मध्यवर्ती ग्रंथालय<br>• संगणक लॅब<br>• मुलींचे वसतिगृह<br>• कॅन्टीन<br>• महाविद्यालय बस<br>• Wi-Fi<br>• क्रीडांगण<br>• सेमिनार हॉल<br>• 24x7 CCTV<br><b>संपर्क:</b> 9960590202', NULL);

INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES ('help', 'greet', '<b>🤖 COET Akola Chatbot - Help Menu</b><br><br>You can ask me about:<br><br>🎓 <b>Admission:</b> admission, eligibility, documents, how to take admission<br>💰 <b>Fees:</b> fee, fee structure, scholarship, fee payment<br>🏠 <b>Hostel:</b> hostel, hostel fee, hostel rules, hostel admission<br>📚 <b>Courses:</b> course, computer, civil, mechanical, chemical, IT, MBA<br>📊 <b>Academics:</b> exam, result, attendance, marksheet, revaluation, ATKT<br>💼 <b>Placement:</b> placement, internship, placement process<br>📍 <b>Campus:</b> location, facilities, timing, wifi, transport, canteen, library<br>👨‍👩‍👧 <b>Parents:</b> parent, grievance, safety, contact<br>🎓 <b>Principal:</b> principal<br><br>Type any keyword in English, Hindi or Marathi!', '<b>🤖 COET अकोला चैटबॉट - सहायता</b><br>आप पूछ सकते हैं:<br>🎓 प्रवेश | 💰 शुल्क | 🏠 छात्रावास | 📚 कोर्स<br>📊 परीक्षा/परिणाम | 💼 प्लेसमेंट | 📍 स्थान | 🎓 प्राचार्य<br>अंग्रेजी, हिंदी या मराठी में पूछें!', '<b>🤖 COET अकोला चॅटबॉट - मदत</b><br>तुम्ही विचारू शकता:<br>🎓 प्रवेश | 💰 शुल्क | 🏠 वसतिगृह | 📚 अभ्यासक्रम<br>📊 परीक्षा/निकाल | 💼 प्लेसमेंट | 📍 स्थान | 🎓 प्राचार्य<br>इंग्रजी, हिंदी किंवा मराठीत विचारा!', NULL);

-- Common conversational triggers
INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES ('bye', 'greet', '👋 Thank you for visiting COET Akola Chatbot! For more info contact us at 9960590202. Have a great day! 😊', '👋 COET अकोला चैटबॉट पर आने का धन्यवाद! अधिक जानकारी के लिए: 9960590202. शुभ दिन! 😊', '👋 COET अकोला चॅटबॉटला भेट दिल्याबद्दल धन्यवाद! अधिक माहितीसाठी: 9960590202. शुभ दिवस! 😊', NULL);

INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES ('thank you', 'greet', '😊 You are welcome! Feel free to ask anything about COET Akola. We are here to help! 📞 9960590202', '😊 आपका स्वागत है! COET अकोला के बारे में कुछ भी पूछें। हम मदद के लिए यहाँ हैं! 📞 9960590202', '😊 आपले स्वागत आहे! COET अकोलाबद्दल काहीही विचारा. आम्ही मदतीसाठी येथे आहोत! 📞 9960590202', NULL);

INSERT INTO chatbot (keyword, category, reply, reply_hindi, reply_marathi, image) VALUES ('धन्यवाद', 'greet', '😊 You are welcome! Ask anything about COET Akola anytime! 📞 9960590202', '😊 आपका स्वागत है! कभी भी COET अकोला के बारे में पूछें! 📞 9960590202', '😊 आपले स्वागत! कधीही COET अकोलाबद्दल विचारा! 📞 9960590202', NULL);

SELECT COUNT(*) AS total_keywords FROM chatbot;
