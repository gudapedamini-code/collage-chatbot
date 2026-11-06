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
    // ⚠️ ADD YOUR FREE GEMINI API KEY HERE
    // Free key at: https://aistudio.google.com/app/apikey
    $GEMINI_API_KEY = 'AIzaSyDv6o4L-FBL1RCZwCnvHB_ixgnjpLNJ2ug';

    if ($GEMINI_API_KEY === 'YOUR_GEMINI_API_KEY_HERE') return null;

    $langName = $lang==='hi' ? 'Hindi' : ($lang==='mr' ? 'Marathi' : 'English');
    $context = "You are the official chatbot of COET Akola (College of Engineering & Technology, Akola).
Key facts: Principal Dr P.V. Thorat (9960590202), NAAC Grade A, AICTE approved, SGBAU affiliated,
Shri Shivaji Education Society Amravati. Courses: B.E.(CSE,IT,Civil,Mech,Chemical), B.Arch, MBA, M.E., D.Arch.
B.E. fee Rs 1.2L/year, Hostel Rs 24,000/year (girls only), Placement 350+ students (TCS,Wipro,Capgemini).
Address: Babhulgaon NH6 Akola 444104. Office: Mon-Sat 9AM-5PM.
Answer in {$langName} using HTML <b> and <br> tags. Be friendly, concise and helpful.
If unrelated to college, politely redirect to college topics.";

    $url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=$GEMINI_API_KEY";
    $payload = json_encode([
        "contents"=>[["parts"=>[["text"=>$context."\n\nQuestion: ".$userMessage]]]],
        "generationConfig"=>["temperature"=>0.7,"maxOutputTokens"=>350]
    ]);

    $ch = curl_init($url);
    curl_setopt_array($ch,[
        CURLOPT_RETURNTRANSFER=>true, CURLOPT_POST=>true,
        CURLOPT_POSTFIELDS=>$payload,
        CURLOPT_HTTPHEADER=>['Content-Type: application/json'],
        CURLOPT_TIMEOUT=>8, CURLOPT_SSL_VERIFYPEER=>false,
    ]);
    $res = curl_exec($ch);
    $code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    if ($code===200 && $res) {
        $data = json_decode($res,true);
        $text = $data['candidates'][0]['content']['parts'][0]['text'] ?? null;
        if ($text) return ["reply"=>"🤖 ".nl2br(trim($text)),"image"=>null,"category"=>"ai","lang"=>$lang];
    }
    return null;
}

// ── Main reply function ──
function getReply($conn, $message, $forceLang=null) {
    $orig  = trim($message);
    $lang  = $forceLang ?? detectLanguage($orig);
    $lower = mb_strtolower($orig);

    // 1. Smart keyword extraction + DB search
    $smart = extractKeyword($lower);
    $res   = dbSearch($conn, $smart, $lang);
    if ($res) return $res;

    // 2. Try original message directly
    if ($smart !== $lower) {
        $res = dbSearch($conn, $lower, $lang);
        if ($res) return $res;
    }

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
