<?php
// ============================================================
//  CHATMODEL — COET Akola | Smart AI-Powered Matching
//  - Exact match → Fuzzy match → Synonym map
//  - Topic detection → Gemini AI fallback
//  - Always gives a relevant answer
// ============================================================

// ── Auto detect language ──
function detectLanguage($message) {
    $marathiWords = ['आहे','नाही','काय','कसे','सांगा','वसतिगृह','शुल्क','महाविद्यालय',
        'अभ्यासक्रम','प्रवेश','ग्रंथालय','कॅन्टीन','वेळ','माहिती','कुठे','किती','कोण',
        'मला','आपल्या','येथे','प्राचार्य','विभाग','जागा','वर्षे','परीक्षा','शिष्यवृत्ती',
        'निकाल','उपस्थिती','क्रीडा','वाहतूक','कॅम्पस','नोंदणी'];
    $hindiWords = ['है','नहीं','क्या','कैसे','बताओ','छात्रावास','शुल्क','कॉलेज',
        'कोर्स','प्रवेश','पुस्तकालय','कैंटीन','समय','जानकारी','कहाँ','कितना','कौन',
        'मुझे','हमारे','यहाँ','प्राचार्य','विभाग','सीटें','साल','परीक्षा','छात्रवृत्ति',
        'नमस्ते','परिणाम','उपस्थिति','खेल','परिवहन','बस','कैंपस','पंजीकरण'];
    foreach ($marathiWords as $w) { if (mb_strpos($message,$w)!==false) return 'mr'; }
    foreach ($hindiWords  as $w) { if (mb_strpos($message,$w)!==false) return 'hi'; }
    return 'en';
}

// ── Synonym / alias map ──
function getSynonymMap() {
    return [
        'admission'=>'admission','admissions'=>'admission','join'=>'admission',
        'enroll'=>'admission','enrollment'=>'admission','apply'=>'admission',
        'register'=>'admission','registration'=>'admission','form'=>'admission',
        'दाखिला'=>'प्रवेश','भर्ती'=>'प्रवेश','अर्ज'=>'प्रवेश',
        'fee'=>'fee','fees'=>'fee','tuition'=>'fee','charges'=>'fee','cost'=>'fee',
        'payment'=>'fee payment','pay'=>'fee payment','kitna'=>'kitna fee hai',
        'कितनी फीस'=>'kitna fee hai','कितना लगेगा'=>'kitna fee hai','खर्च'=>'fee',
        'scholarship'=>'scholarship','scholarships'=>'scholarship','grant'=>'scholarship',
        'waiver'=>'scholarship','concession'=>'scholarship','sc st'=>'scholarship',
        'obc'=>'scholarship','छात्रवृत्ति'=>'scholarship',
        'principal'=>'principal','director'=>'principal','thorat'=>'principal',
        'dr thorat'=>'principal','प्राचार्य'=>'principal',
        'hostel'=>'hostel','dormitory'=>'hostel','accommodation'=>'hostel',
        'stay'=>'hostel','room'=>'hostel','boarding'=>'hostel',
        'रहना'=>'hostel','वसतिगृह'=>'hostel','छात्रावास'=>'hostel',
        'library'=>'library','books'=>'library','reading'=>'library',
        'पुस्तकालय'=>'library','ग्रंथालय'=>'library',
        'canteen'=>'canteen','food'=>'canteen','eat'=>'canteen','meal'=>'canteen',
        'mess'=>'canteen','cafe'=>'canteen','lunch'=>'canteen','khana'=>'canteen',
        'खाना'=>'canteen','भोजन'=>'canteen','कॅन्टीन'=>'canteen',
        'placement'=>'placement','job'=>'placement','jobs'=>'placement',
        'career'=>'placement','recruit'=>'placement','package'=>'placement',
        'salary'=>'placement','tcs'=>'placement','wipro'=>'placement',
        'नौकरी'=>'placement','रोजगार'=>'placement',
        'internship'=>'internship','intern'=>'internship','training'=>'internship',
        'transport'=>'transport','bus'=>'transport','vehicle'=>'transport',
        'route'=>'transport','बस'=>'transport','वाहन'=>'transport',
        'contact'=>'contact','phone'=>'contact','number'=>'contact',
        'call'=>'contact','email'=>'contact','संपर्क'=>'contact','फोन'=>'contact',
        'location'=>'location','where'=>'location','map'=>'location',
        'directions'=>'location','campus'=>'location','कहाँ है'=>'location',
        'course'=>'course','courses'=>'course','degree'=>'course',
        'program'=>'course','branch'=>'course','stream'=>'course',
        'कोर्स'=>'course','अभ्यासक्रम'=>'course',
        'cse'=>'computer','cs'=>'computer','computer'=>'computer',
        'it'=>'information technology','information technology'=>'information technology',
        'civil'=>'civil','mechanical'=>'mechanical','mech'=>'mechanical',
        'chemical'=>'chemical','chem'=>'chemical','mba'=>'mba',
        'architecture'=>'interior','arch'=>'interior','interior'=>'interior',
        'design'=>'interior','barch'=>'interior','d arch'=>'d arch',
        'exam'=>'exam','examination'=>'exam','test'=>'exam',
        'semester'=>'exam','sem'=>'exam','परीक्षा'=>'exam',
        'result'=>'result','results'=>'result','marks'=>'result',
        'grade'=>'result','परिणाम'=>'result','निकाल'=>'result',
        'marksheet'=>'marksheet','certificate'=>'marksheet',
        'atkt'=>'atkt','backlog'=>'atkt','fail'=>'atkt',
        'revaluation'=>'revaluation','reval'=>'revaluation',
        'attendance'=>'attendance','absent'=>'attendance',
        'उपस्थिति'=>'attendance','उपस्थिती'=>'attendance',
        'sports'=>'sports','game'=>'sports','cricket'=>'sports',
        'basketball'=>'sports','volleyball'=>'sports','badminton'=>'sports',
        'nss'=>'sports','cultural'=>'sports','fest'=>'sports','खेल'=>'sports',
        'wifi'=>'wifi','internet'=>'wifi','wi-fi'=>'wifi','network'=>'wifi',
        'id card'=>'id card','identity'=>'id card','id'=>'id card',
        'safety'=>'safety','security'=>'safety','ragging'=>'safety','cctv'=>'safety',
        'parent'=>'parent','guardian'=>'parent','parents'=>'parent','ptm'=>'parent',
        'पालक'=>'parent','अभिभावक'=>'parent',
        'grievance'=>'grievance','complaint'=>'grievance','problem'=>'grievance',
        'शिकायत'=>'grievance','तक्रार'=>'grievance',
        'timing'=>'timing','time'=>'timing','schedule'=>'timing','hours'=>'timing',
        'समय'=>'timing','वेळ'=>'timing',
        'naac'=>'naac','aicte'=>'naac','affiliation'=>'naac','sgbau'=>'naac',
        'about'=>'about college','history'=>'about college','facilities'=>'facilities',
        'hello'=>'hello','hi'=>'hi','hey'=>'hello','namaste'=>'नमस्ते',
        'नमस्ते'=>'नमस्ते','नमस्कार'=>'नमस्ते',
        'help'=>'help','menu'=>'help','options'=>'help',
        'bye'=>'bye','goodbye'=>'bye','thanks'=>'thank you','thank'=>'thank you',
        'धन्यवाद'=>'धन्यवाद',
    ];
}

// ── Extract keyword from message using synonym map ──
function extractKeyword($msg) {
    $synonyms = getSynonymMap();
    if (isset($synonyms[$msg])) return $synonyms[$msg];
    // Sort by key length descending (longer phrases first)
    uksort($synonyms, fn($a,$b) => mb_strlen($b) - mb_strlen($a));
    foreach ($synonyms as $pattern => $keyword) {
        if (mb_strpos($msg, $pattern) !== false) return $keyword;
    }
    return $msg;
}

// ── DB search with keyword ──
function dbSearch($conn, $keyword, $lang) {
    // Pass 1: message contains keyword OR keyword contains message
    $stmt = $conn->prepare(
        "SELECT reply,reply_hindi,reply_marathi,image,category,keyword
         FROM chatbot
         WHERE LOWER(?) LIKE CONCAT('%',LOWER(keyword),'%')
            OR LOWER(keyword) LIKE CONCAT('%',LOWER(?),'%')
         ORDER BY LENGTH(keyword) DESC LIMIT 1"
    );
    if ($stmt) {
        $stmt->bind_param("ss", $keyword, $keyword);
        $stmt->execute();
        $r = $stmt->get_result();
        if ($r && $r->num_rows > 0) { $row=$r->fetch_assoc(); $stmt->close(); return buildResponse($row,$lang); }
        $stmt->close();
    }

    // Pass 2: word by word
    $words = array_filter(preg_split('/\s+/', $keyword), fn($w)=>mb_strlen($w)>=3);
    foreach ($words as $word) {
        $stmt2 = $conn->prepare(
            "SELECT reply,reply_hindi,reply_marathi,image,category,keyword
             FROM chatbot
             WHERE LOWER(keyword) LIKE CONCAT('%',LOWER(?),'%')
                OR LOWER(?) LIKE CONCAT('%',LOWER(keyword),'%')
             ORDER BY LENGTH(keyword) DESC LIMIT 1"
        );
        if (!$stmt2) continue;
        $stmt2->bind_param("ss",$word,$word);
        $stmt2->execute();
        $r2=$stmt2->get_result();
        if ($r2 && $r2->num_rows>0) { $row=$r2->fetch_assoc(); $stmt2->close(); return buildResponse($row,$lang); }
        $stmt2->close();
    }
    return null;
}

// ── Gemini AI fallback ──
function getAIFallback($userMessage, $lang) {
    $GEMINI_API_KEY = getenv('GEMINI_API_KEY') ?: ($_ENV['GEMINI_API_KEY'] ?? '');

    if (empty($GEMINI_API_KEY) || $GEMINI_API_KEY === 'your_gemini_api_key_here' || $GEMINI_API_KEY === 'YOUR_GEMINI_API_KEY_HERE') {
        return null;
    }

    $langName = $lang==='hi' ? 'Hindi' : ($lang==='mr' ? 'Marathi' : 'English');
    $context = "You are the official chatbot of COET Akola (College of Engineering & Technology, Akola).
Key facts: Principal Dr P.V. Thorat (9960590202), NAAC Grade A, AICTE approved, SGBAU affiliated,
Shri Shivaji Education Society Amravati. Courses: B.E.(CSE,IT,Civil,Mech,Chemical), B.Arch, MBA, M.E., D.Arch.
B.E. fee Rs 1.2L/year, Hostel Rs 24,000/year (girls only), Placement 350+ students (TCS,Wipro,Capgemini).
Address: Babhulgaon NH6 Akola 444104. Office: Mon-Sat 9AM-5PM.
Answer in {$langName} using HTML <b> and <br> tags. Be friendly, concise and helpful.
If unrelated to college, politely redirect to college topics.";

    $url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=" . urlencode($GEMINI_API_KEY);
    $payload = json_encode([
        "contents"=>[["parts"=>[["text"=>$context."\n\nQuestion: ".$userMessage]]]],
        "generationConfig"=>["temperature"=>0.7,"maxOutputTokens"=>350]
    ]);

    $res = false;
    $code = 0;

    if (function_exists('curl_init')) {
        $ch = curl_init($url);
        curl_setopt_array($ch,[
            CURLOPT_RETURNTRANSFER=>true, 
            CURLOPT_POST=>true,
            CURLOPT_POSTFIELDS=>$payload,
            CURLOPT_HTTPHEADER=>['Content-Type: application/json'],
            CURLOPT_TIMEOUT=>8, 
            CURLOPT_SSL_VERIFYPEER=>false,
        ]);
        $res = curl_exec($ch);
        $code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);
    } else {
        $opts = [
            'http' => [
                'method'  => 'POST',
                'header'  => "Content-Type: application/json\r\n",
                'content' => $payload,
                'timeout' => 8,
                'ignore_errors' => true
            ],
            'ssl' => [
                'verify_peer' => false,
                'verify_peer_name' => false
            ]
        ];
        $streamCtx = stream_context_create($opts);
        $res = @file_get_contents($url, false, $streamCtx);
        if ($res && isset($http_response_header[0]) && preg_match('{HTTP\/\S*\s(\d{3})}', $http_response_header[0], $m)) {
            $code = (int)$m[1];
        }
    }

    if ($code===200 && $res) {
        $data = json_decode($res,true);
        $text = $data['candidates'][0]['content']['parts'][0]['text'] ?? null;
        if ($text) return ["reply"=>"🤖 ".nl2br(trim($text)),"image"=>null,"category"=>"ai","lang"=>$lang];
    }
    return null;
}

// ── Built-in Knowledge Base (Works without MySQL on Vercel/Cloud) ──
function localKnowledgeSearch($msg, $lang) {
    $knowledge = [
        'principal' => [
            'en' => "<b>🎓 Principal</b><br><b>Dr. P.V. Thorat</b><br><b>Qualification:</b> Ph.D. in Chemical Engineering, M.Tech<br><b>Phone:</b> 9960590202<br><b>College:</b> College of Engineering and Technology, Akola<br><b>Affiliated to:</b> Sant Gadge Baba Amravati University<br><b>Office Hours:</b> Mon-Sat, 10:00 AM – 4:00 PM",
            'hi' => "<b>🎓 प्राचार्य</b><br><b>डॉ. पी.व्ही. थोरात</b><br><b>योग्यता:</b> पीएच.डी. रासायनिक अभियांत्रिकी, एम.टेक<br><b>फोन:</b> 9960590202<br><b>कार्यालय समय:</b> सोम-शनि, सुबह 10 – शाम 4",
            'mr' => "<b>🎓 प्राचार्य</b><br><b>डॉ. पी.व्ही. थोरात</b><br><b>पात्रता:</b> पीएच.डी. रासायनिक अभियांत्रिकी, एम.टेक<br><b>फोन:</b> 9960590202<br><b>कार्यालय वेळ:</b> सोम-शनि, सकाळी 10 – सायंकाळी 4",
            'img' => null
        ],
        'courses' => [
            'en' => "<b>📚 Courses Offered - COET Akola</b><br><br><b>U.G. Courses:</b><br>• B.E. Computer Science & Engg (180 seats)<br>• B.E. Information Technology (120 seats)<br>• B.E. Civil Engineering (60 seats)<br>• B.E. Mechanical Engineering (60 seats)<br>• B.E. Chemical Engineering (60 seats)<br>• B.Arch (Architecture)<br><br><b>P.G. & Other:</b><br>• MBA (60 seats)<br>• M.E. CSE / Chemical / Structural<br>• D.Arch (Diploma)",
            'hi' => "<b>📚 COET अकोला में उपलब्ध कोर्स:</b><br>• बी.ई. कंप्यूटर साइंस (180 सीटें)<br>• बी.ई. आईटी (120 सीटें)<br>• बी.ई. सिविल / मैकेनिकल / केमिकल<br>• बी.आर्क (वास्तुकला)<br>• MBA (60 सीटें)<br>• M.E. एवं डिप्लोमा",
            'mr' => "<b>📚 COET अकोला मधील अभ्यासक्रम:</b><br>• B.E. संगणक अभियांत्रिकी (180 जागा)<br>• B.E. माहिती तंत्रज्ञान (IT - 120 जागा)<br>• B.E. सिव्हिल / मेकॅनिकल / केमिकल<br>• B.Arch (वास्तुकला)<br>• MBA (60 जागा)<br>• M.E. आणि पदविका",
            'img' => null
        ],
        'computer' => [
            'en' => "<b>🖥️ Computer Science & Engineering Department</b><br><b>Intake:</b> 180 Seats | <b>Duration:</b> 4 Years<br>Well-equipped programming labs, High-speed Internet, AI/ML specialization, and top campus placement track record.",
            'hi' => "<b>🖥️ कंप्यूटर साइंस एवं इंजीनियरिंग विभाग:</b><br><b>सीटें:</b> 180 | <b>अवधि:</b> 4 वर्ष<br>आधुनिक कंप्यूटर लैब्स, AI/ML एवं उत्कृष्ट प्लेसमेंट रिकॉर्ड।",
            'mr' => "<b>🖥️ संगणक अभियांत्रिकी विभाग (CSE):</b><br><b>जागा:</b> 180 | <b>कालावधी:</b> 4 वर्षे<br>अत्याधुनिक संगणक लॅब, AI/ML चे मार्गदर्शन आणि उत्कृष्ट कॅम्पस प्लेसमेंट.",
            'img' => null
        ],
        'information technology' => [
            'en' => "<b>💻 Information Technology (IT) Department</b><br><b>Intake:</b> 120 Seats | <b>Duration:</b> 4 Years<br>Cloud computing, Web/App development, Cyber security labs, and strong IT company placement ties.",
            'hi' => "<b>💻 सूचना प्रौद्योगिकी (IT) विभाग:</b><br><b>सीटें:</b> 120 | <b>अवधि:</b> 4 वर्ष<br>क्लाउड कंप्यूटिंग, वेब डेवलपमेंट एवं सॉफ्टवेयर इंडस्ट्री के लिए विशेष प्रशिक्षण।",
            'mr' => "<b>💻 माहिती तंत्रज्ञान विभाग (IT):</b><br><b>जागा:</b> 120 | <b>कालावधी:</b> 4 वर्षे<br>क्लाउड कॉम्प्युटिंग, वेब व अ‍ॅप डेव्हलपमेंट आणि सॉफ्टवेअर प्लेसमेंटच्या संधी.",
            'img' => null
        ],
        'civil' => [
            'en' => "<b>🏗️ Civil Engineering Department</b><br><b>Intake:</b> 60 Seats | <b>Duration:</b> 4 Years<br>Advanced Surveying, Structural analysis, CAD lab, and government/private sector career training.",
            'hi' => "<b>🏗️ सिविल इंजीनियरिंग विभाग:</b><br><b>सीटें:</b> 60 | <b>अवधि:</b> 4 वर्ष<br>सर्वेइंग, स्ट्रक्चरल डिजाइन एवं निर्माण क्षेत्र की व्यापक ट्रेनिंग।",
            'mr' => "<b>🏗️ सिव्हिल इंजिनिअरिंग विभाग:</b><br><b>जागा:</b> 60 | <b>कालावधी:</b> 4 वर्षे<br>स्ट्रक्चरल डिझाईन, सर्व्हेइंग लॅब आणि बांधकाम क्षेत्रातील करिअर मार्गदर्शन.",
            'img' => null
        ],
        'mechanical' => [
            'en' => "<b>⚙️ Mechanical Engineering Department</b><br><b>Intake:</b> 60 Seats | <b>Duration:</b> 4 Years<br>Robotics lab, CNC machines, Automobile & Thermal engineering workshops.",
            'hi' => "<b>⚙️ मैकेनिकल इंजीनियरिंग विभाग:</b><br><b>सीटें:</b> 60 | <b>अवधि:</b> 4 वर्ष<br>रोबोटिक्स, सीएनसी एवं ऑटोमोबाइल वर्कशॉप्स।",
            'mr' => "<b>⚙️ मेकॅनिकल इंजिनिअरिंग विभाग:</b><br><b>जागा:</b> 60 | <b>कालावधी:</b> 4 वर्षे<br>रोबोटिक्स, CNC मशिन्स आणि ऑटोमोबाईल वर्कशॉप.",
            'img' => null
        ],
        'chemical' => [
            'en' => "<b>🧪 Chemical Engineering Department</b><br><b>Intake:</b> 60 Seats | <b>Duration:</b> 4 Years<br>One of Vidarbha's top Chemical Engineering departments with extensive industrial partnerships.",
            'hi' => "<b>🧪 केमिकल इंजीनियरिंग विभाग:</b><br><b>सीटें:</b> 60 | <b>अवधि:</b> 4 वर्ष<br>विदर्भ के सबसे प्रतिष्ठित केमिकल इंजीनियरिंग विभागों में से एक।",
            'mr' => "<b>🧪 केमिकल इंजिनिअरिंग विभाग:</b><br><b>जागा:</b> 60 | <b>कालावधी:</b> 4 वर्षे<br>विदर्भातील नामांकित केमिकल विभाग आणि थेट औद्योगिक प्रशिक्षण.",
            'img' => null
        ],
        'mba' => [
            'en' => "<b>💼 MBA Department</b><br><b>Intake:</b> 60 Seats | <b>Duration:</b> 2 Years<br>Specializations in Marketing, Finance, HR and Operations with case study pedagogy.",
            'hi' => "<b>💼 MBA विभाग:</b><br><b>सीटें:</b> 60 | <b>अवधि:</b> 2 वर्ष<br>मार्केटिंग, फाइनेंस, एचआर स्पेशलाइजेशन।",
            'mr' => "<b>💼 MBA विभाग:</b><br><b>जागा:</b> 60 | <b>कालावधी:</b> 2 वर्षे<br>मार्केटिंग, फायनान्स, एचआर व ऑपरेशन्स.",
            'img' => null
        ],
        'fee' => [
            'en' => "<b>💰 Fee Structure 2025-2026 - COET Akola</b><br><br>• <b>B.E. First Year:</b> Open: ₹1,20,531 | OBC: ₹69,439 | SC/ST: ₹3,531<br>• <b>B.Arch:</b> Open: ₹1,19,264 | OBC: ₹67,937<br>• <b>MBA:</b> Open: ₹1,01,864 | OBC: ₹56,410<br>• <b>D.Arch:</b> Open: ₹47,454<br><br><b>Scholarships:</b> Available for SC, ST, OBC, EWS, and Girls TFWS scheme.",
            'hi' => "<b>💰 शुल्क संरचना 2025-2026:</b><br>• बी.ई. प्रथम वर्ष (Open): ₹1,20,531 | OBC: ₹69,439 | SC/ST: ₹3,531<br>• बी.आर्क: ₹1,19,264 | MBA: ₹1,01,864<br><b>छात्रवृत्ति:</b> SC, ST, OBC, EWS एवं TFWS उपलब्ध।",
            'mr' => "<b>💰 फी रचना 2025-2026:</b><br>• B.E. प्रथम वर्ष (Open): ₹1,20,531 | OBC: ₹69,439 | SC/ST: ₹3,531<br>• B.Arch: ₹1,19,264 | MBA: ₹1,01,864<br><b>शिष्यवृत्ती:</b> SC, ST, OBC, EWS आणि मुलींसाठी TFWS उपलब्ध.",
            'img' => null
        ],
        'hostel' => [
            'en' => "<b>🏠 Hostel Facility - COET Akola</b><br><br><b>Girls Hostel:</b> Available inside campus.<br>• <b>Fee:</b> Approx ₹24,000 / year<br>• <b>Facilities:</b> 24x7 Security, CCTV, Wi-Fi, Hygienic Mess, Study Hall, RO Water.<br><b>Boys Hostel:</b> Private hostels & PGs available right outside campus gate.",
            'hi' => "<b>🏠 छात्रावास (हॉस्टल) सुविधा:</b><br><b>गर्ल्स हॉस्टल:</b> कैंपस के अंदर उपलब्ध (₹24,000/वर्ष)<br>सुविधाएं: 24x7 सुरक्षा, CCTV, Wi-Fi, मेस, RO पानी.<br><b>बॉयज हॉस्टल:</b> कॉलेज गेट के बाहर निजी हॉस्टल व पीजी उपलब्ध हैं।",
            'mr' => "<b>🏠 वसतिगृह सुविधा:</b><br><b>मुलींचे वसतिगृह:</b> कॅम्पसमध्ये उपलब्ध (अंदाजे ₹24,000/वर्ष)<br>सुविधा: 24x7 सुरक्षा, CCTV, Wi-Fi, मेस, RO पाणी.<br><b>मुलांचे वसतिगृह:</b> कॅम्पसबाहेर खाजगी वसतिगृह व PG उपलब्ध आहेत.",
            'img' => "hostel_front.jpeg,hostel_building.jpeg,hostel_corridor.jpeg,hostel_mess.jpeg"
        ],
        'placement' => [
            'en' => "<b>💼 Placement Cell - COET Akola</b><br><br>• <b>Placements:</b> 350+ Students placed every year.<br>• <b>Top Recruiters:</b> TCS, Wipro, Capgemini, Infosys, Cognizant, Tech Mahindra.<br>• <b>Highest Package:</b> ₹8 - 10 LPA | <b>Average:</b> ₹3.5 - 4.5 LPA.<br>• Dedicated Training & Placement Cell with soft skills & aptitude sessions.",
            'hi' => "<b>💼 प्लेसमेंट सेल - COET अकोला</b><br>• 350+ छात्रों का प्रतिवर्ष प्लेसमेंट.<br>• प्रमुख कंपनियां: TCS, Wipro, Capgemini, Infosys.<br>• उच्चतम पैकेज: ₹8-10 LPA | औसत: ₹3.5-4.5 LPA.",
            'mr' => "<b>💼 प्लेसमेंट विभाग - COET अकोला</b><br>• दरवर्षी 350+ विद्यार्थ्यांचे प्लेसमेंट.<br>• प्रमुख कंपन्या: TCS, Wipro, Capgemini, Infosys.<br>• सर्वोच्च पॅकेज: ₹8-10 LPA | सरासरी: ₹3.5-4.5 LPA.",
            'img' => null
        ],
        'admission' => [
            'en' => "<b>📋 Admission Procedure - COET Akola</b><br><br>• <b>Eligibility:</b> 12th (HSC) with PCM + MHT-CET / JEE Main score.<br>• <b>Process:</b> Through Maharashtra State CET Cell Centralized Admission Process (CAP).<br>• <b>College Code:</b> Institute Code available on DTE portal.<br>• <b>Helpline:</b> 9960590202 / Admissions Office.",
            'hi' => "<b>📋 प्रवेश प्रक्रिया:</b><br>• पात्रता: 12वीं PCM + MHT-CET या JEE Main स्कोर.<br>• प्रक्रिया: महाराष्ट्र CET Cell CAP राउंड के माध्यम से.<br>• अधिक जानकारी के लिए: 9960590202",
            'mr' => "<b>📋 प्रवेश प्रक्रिया:</b><br>• पात्रता: 12 वी PCM + MHT-CET किंवा JEE Main.<br>• प्रवेश: महाराष्ट्र CET Cell च्या CAP फेरीद्वारे.<br>• संपर्क: 9960590202",
            'img' => null
        ],
        'canteen' => [
            'en' => "<b>🍽️ Campus Canteen</b><br>Hygienic vegetarian breakfast, lunch, snacks, tea and coffee available at affordable student rates.",
            'hi' => "<b>🍽️ कॉलेज कैंटीन:</b><br>स्वच्छ शाकाहारी नाश्ता, भोजन और चाय-कॉफ़ी किफायती दरों पर उपलब्ध।",
            'mr' => "<b>🍽️ महाविद्यालय कॅन्टीन:</b><br>स्वच्छ आणि चवदार अल्पोपहार, जेवण आणि चहा-कॉफी सवलतीच्या दरात उपलब्ध.",
            'img' => "canteen1.jpeg"
        ],
        'library' => [
            'en' => "<b>📖 Central Library</b><br>Timings: 9:00 AM – 5:00 PM (Mon-Sat). 40,000+ technical books, national/international journals, e-library & reading hall.",
            'hi' => "<b>📖 केंद्रीय पुस्तकालय:</b><br>समय: सुबह 9 से शाम 5 बजे. 40,000+ पुस्तकें, जर्नल्स और डिजिटल ई-लाइब्रेरी.",
            'mr' => "<b>📖 मध्यवर्ती ग्रंथालय:</b><br>वेळ: सकाळी 9 ते संध्याकाळी 5. 40,000+ पुस्तके, मासिके आणि ई-लायब्ररी.",
            'img' => "library1.jpeg"
        ],
        'contact' => [
            'en' => "<b>📞 Contact & Location - COET Akola</b><br><b>Address:</b> Babhulgaon (Jhiri), National Highway No. 6, Akola - 444104, Maharashtra.<br><b>Phone:</b> 9960590202<br><b>Email:</b> principal@coetakola.ac.in<br><b>Website:</b> https://coetakola.ac.in",
            'hi' => "<b>📞 संपर्क और पता:</b><br>बभुलगांव, राष्ट्रीय महामार्ग क्र. 6, अकोला - 444104.<br><b>फोन:</b> 9960590202 | <b>वेबसाइट:</b> https://coetakola.ac.in",
            'mr' => "<b>📞 संपर्क आणि पत्ता:</b><br>बाभूळगाव, राष्ट्रीय महामार्ग क्र. 6, अकोला - 444104.<br><b>फोन:</b> 9960590202 | <b>वेबसाईट:</b> https://coetakola.ac.in",
            'img' => null
        ],
        'greet' => [
            'en' => "👋 Hello! I am the COET Akola Virtual Assistant. How can I help you today? You can ask about Courses, Fees, Hostel, Placements, or Admissions!",
            'hi' => "👋 नमस्ते! मैं COET अकोला का वर्चुअल असिस्टेंट हूँ। आप प्रवेश, शुल्क, हॉस्टल, कोर्स या प्लेसमेंट के बारे में पूछ सकते हैं!",
            'mr' => "👋 नमस्कार! मी COET अकोलाचा व्हर्च्युअल असिस्टंट आहे. आपण प्रवेश, फी, वसतिगृह, अभ्यासक्रम किंवा प्लेसमेंटबद्दल विचारू शकता!",
            'img' => null
        ]
    ];

    $smart = extractKeyword($msg);

    // Map common keywords to knowledge keys
    $map = [
        'principal'=>'principal', 'courses'=>'courses', 'course'=>'courses',
        'computer'=>'computer', 'information technology'=>'information technology',
        'civil'=>'civil', 'mechanical'=>'mechanical', 'chemical'=>'chemical', 'mba'=>'mba',
        'fee'=>'fee', 'fees'=>'fee', 'scholarship'=>'fee',
        'hostel'=>'hostel', 'canteen'=>'canteen', 'library'=>'library',
        'placement'=>'placement', 'admission'=>'admission', 'contact'=>'contact',
        'hello'=>'greet', 'hi'=>'greet', 'namaste'=>'greet', 'help'=>'greet'
    ];

    $targetKey = $map[$smart] ?? ($map[$msg] ?? null);
    if (!$targetKey) {
        foreach ($map as $k => $v) {
            if (mb_strpos($msg, $k) !== false) {
                $targetKey = $v;
                break;
            }
        }
    }

    if ($targetKey && isset($knowledge[$targetKey])) {
        $item = $knowledge[$targetKey];
        $text = $item[$lang] ?? $item['en'];
        return [
            "reply" => $text,
            "image" => $item['img'],
            "category" => $targetKey,
            "lang" => $lang
        ];
    }

    return null;
}

// ── Main reply function ──
function getReply($conn, $message, $forceLang=null) {
    $orig  = trim($message);
    $lang  = $forceLang ?? detectLanguage($orig);
    $lower = mb_strtolower($orig);

    // 1. If DB connection is available, search DB
    if ($conn) {
        $smart = extractKeyword($lower);
        $res   = dbSearch($conn, $smart, $lang);
        if ($res) return $res;

        if ($smart !== $lower) {
            $res = dbSearch($conn, $lower, $lang);
            if ($res) return $res;
        }
    }

    // 2. Built-in Knowledge Base (Fast, reliable, works without DB on Vercel)
    $local = localKnowledgeSearch($lower, $lang);
    if ($local) return $local;

    // 3. Gemini AI fallback
    $ai = getAIFallback($orig, $lang);
    if ($ai) return $ai;

    // 4. Smart not-found with suggestions
    return buildSmartNotFound($orig, $lang);
}

// ── Build response ──
function buildResponse($row, $lang) {
    if ($lang==='hi' && !empty($row['reply_hindi'])) $reply=$row['reply_hindi'];
    elseif ($lang==='mr' && !empty($row['reply_marathi'])) $reply=$row['reply_marathi'];
    else $reply=$row['reply'];
    return ["reply"=>$reply,"image"=>$row['image']??null,"category"=>$row['category']??null,"lang"=>$lang];
}

// ── Smart not-found response ──
function buildSmartNotFound($message, $lang) {
    $q = htmlspecialchars($message);
    $msgs = [
        'en' => "🤔 I couldn't find info about \"<b>$q</b>\".<br><br>📌 <b>Try asking about:</b><br>🎓 Admission &amp; eligibility | 💰 Fees &amp; scholarships<br>🏠 Hostel | 📚 Courses &amp; departments<br>💼 Placement &amp; internship | 📊 Exam &amp; results<br>📍 Location &amp; transport | 📞 Contact<br><br><i>Keywords: <b>fee, hostel, admission, result, placement</b></i>",
        'hi' => "🤔 \"<b>$q</b>\" की जानकारी नहीं मिली।<br><br>📌 <b>आप पूछ सकते हैं:</b><br>🎓 प्रवेश और पात्रता | 💰 शुल्क और छात्रवृत्ति<br>🏠 छात्रावास | 📚 कोर्स और विभाग<br>💼 प्लेसमेंट | 📊 परीक्षा और परिणाम<br>📍 स्थान और परिवहन | 📞 संपर्क<br><br><i>Keywords: <b>फीस, हॉस्टल, प्रवेश, परिणाम, प्लेसमेंट</b></i>",
        'mr' => "🤔 \"<b>$q</b>\" बद्दल माहिती सापडली नाही.<br><br>📌 <b>तुम्ही विचारू शकता:</b><br>🎓 प्रवेश व पात्रता | 💰 शुल्क व शिष्यवृत्ती<br>🏠 वसतिगृह | 📚 अभ्यासक्रम व विभाग<br>💼 प्लेसमेंट | 📊 परीक्षा व निकाल<br>📍 स्थान व वाहतूक | 📞 संपर्क<br><br><i>Keywords: <b>शुल्क, वसतिगृह, प्रवेश, निकाल, प्लेसमेंट</b></i>",
    ];
    return ["reply"=>$msgs[$lang]??$msgs['en'],"image"=>null,"category"=>null,"lang"=>$lang];
}

function buildErrorResponse() {
    return ["reply"=>"⚠️ Server error. Please try again.","image"=>null,"category"=>null,"lang"=>"en"];
}
?>
