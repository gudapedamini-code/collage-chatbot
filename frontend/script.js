document.addEventListener("DOMContentLoaded", function () {

/* ═══════════════════════════════════════════
   VIDEO ROTATION
═══════════════════════════════════════════ */
const videos = [
  "videos/video1.mp4","videos/video2.mp4",
  "videos/video3.mp4","videos/video4.mp4"
];
let videoIdx = 0;
const bgVideo = document.getElementById("bgVideo");

function playVideo(i, isInitial = false) {
  if (!bgVideo) return;
  if (!isInitial) {
    bgVideo.style.opacity = '0';
    setTimeout(() => {
      bgVideo.pause();
      bgVideo.src = videos[i];
      bgVideo.load();
      bgVideo.muted = true;
      bgVideo.playsInline = true;
      bgVideo.play().catch(() => {});
      bgVideo.style.opacity = '1';
    }, 300);
  } else {
    bgVideo.src = videos[i];
    bgVideo.muted = true;
    bgVideo.playsInline = true;
    bgVideo.play().catch(() => {});
    bgVideo.style.opacity = '1';
  }
}
if (bgVideo) {
  bgVideo.style.transition = 'opacity 0.4s ease';
  playVideo(0, true);
  bgVideo.addEventListener("ended", () => {
    videoIdx = (videoIdx + 1) % videos.length;
    playVideo(videoIdx, false);
  });
}

/* ═══════════════════════════════════════════
   STATE
═══════════════════════════════════════════ */
let currentLang = 'en';
let convState   = 'menu';
let isStreaming = false;

/* ═══════════════════════════════════════════
   LANGUAGE
═══════════════════════════════════════════ */
window.setLang = function(lang) {
  currentLang = lang;
  document.getElementById('userMsg').placeholder =
    lang === 'en' ? 'Type your question...' :
    lang === 'hi' ? 'यहाँ लिखें...' : 'येथे लिहा...';
};

/* ═══════════════════════════════════════════
   CHAT HELPERS
═══════════════════════════════════════════ */
const chatBox = document.getElementById("chatBox");

function scrollDown() {
  chatBox.scrollTop = chatBox.scrollHeight;
}

function addUserMsg(text) {
  const d = document.createElement('div');
  d.className = 'msg-row user-row';
  d.innerHTML = `<div class="msg-av user-av">👤</div><div class="bubble user-bubble">${text}</div>`;
  chatBox.appendChild(d);
  scrollDown();
}

function addBotMsg(html, images = null, chips = null) {
  const d = document.createElement('div');
  d.className = 'msg-row';
  let imgHtml = '';
  if (images && images.length) {
    imgHtml = `<div class="chat-img-slider">${images.map(i =>
      `<img src="images/${i.trim()}" onclick="openImg('images/${i.trim()}')" onerror="this.style.display='none'">`
    ).join('')}</div>`;
  }
  let chipsHtml = '';
  if (chips && chips.length) {
    chipsHtml = `<div class="reply-chips">${chips.map(c =>
      `<button class="reply-chip" onclick="onReplyChip('${c.text}','${c.action}')">${c.label}</button>`
    ).join('')}</div>`;
  }
  d.innerHTML = `<div class="msg-av bot-av">🤖</div><div class="bubble bot-bubble">${html}${imgHtml}${chipsHtml}</div>`;
  chatBox.appendChild(d);
  scrollDown();
  return d.querySelector('.bot-bubble');
}

function showTyping() {
  const d = document.createElement('div');
  d.className = 'typing-row';
  d.id = 'typing';
  d.innerHTML = `<div class="msg-av bot-av">🤖</div><div class="typing-dots"><span></span><span></span><span></span></div>`;
  chatBox.appendChild(d);
  scrollDown();
}
function hideTyping() {
  const t = document.getElementById('typing');
  if (t) t.remove();
}

/* ═══════════════════════════════════════════
   CHATGPT-STYLE STREAMING TYPEWRITER
═══════════════════════════════════════════ */
function streamBotMessage(html, images = null, chips = null, onDone = null) {
  // Strip HTML tags for typewriter, then re-render with HTML
  const d = document.createElement('div');
  d.className = 'msg-row';
  d.innerHTML = `<div class="msg-av bot-av">🤖</div><div class="bubble bot-bubble"><span id="streamContent"></span><span class="stream-cursor"></span></div>`;
  chatBox.appendChild(d);
  scrollDown();

  const contentEl = d.querySelector('#streamContent');
  const cursorEl  = d.querySelector('.stream-cursor');
  const bubble    = d.querySelector('.bot-bubble');

  // We'll type out the raw text, then swap with full HTML
  const tempDiv = document.createElement('div');
  tempDiv.innerHTML = html;
  const plainText = tempDiv.textContent || tempDiv.innerText || '';

  let i = 0;
  const totalLen = plainText.length;

  function typeNext() {
    if (i < totalLen) {
      // High-speed smooth typing (instant user experience)
      const speed = 6;
      const chunk = totalLen > 300 ? 14 : totalLen > 150 ? 8 : 4;

      i = Math.min(i + chunk, totalLen);
      // Show partial plain text while typing
      contentEl.textContent = plainText.substring(0, i);
      scrollDown();
      setTimeout(typeNext, speed);
    } else {
      // Done — replace plain with full rich HTML
      cursorEl.remove();
      contentEl.innerHTML = html;
      contentEl.removeAttribute('id');

      // Append images
      if (images && images.length) {
        const imgDiv = document.createElement('div');
        imgDiv.className = 'chat-img-slider';
        imgDiv.innerHTML = images.map(img =>
          `<img src="images/${img.trim()}" onclick="openImg('images/${img.trim()}')" onerror="this.style.display='none'">`
        ).join('');
        bubble.appendChild(imgDiv);
      }

      // Append reply chips
      if (chips && chips.length) {
        const chipsDiv = document.createElement('div');
        chipsDiv.className = 'reply-chips';
        chipsDiv.innerHTML = chips.map(c =>
          `<button class="reply-chip" onclick="onReplyChip('${c.text}','${c.action}')">${c.label}</button>`
        ).join('');
        bubble.appendChild(chipsDiv);
      }

      scrollDown();
      isStreaming = false;
      document.getElementById('sendBtn').disabled = false;
      if (onDone) onDone();
    }
  }

  typeNext();
}

/* ═══════════════════════════════════════════
   MORE HELP CHIPS
═══════════════════════════════════════════ */
function moreHelp(delay = 900) {
  setTimeout(() => {
    if (isStreaming) return;
    const lbl = {
      en: 'Anything else I can help with?',
      hi: 'और कोई जानकारी?',
      mr: 'आणखी माहिती हवी?'
    }[currentLang];
    addBotMsg(lbl, null, [
      { label:'🎓 Principal', text:'Principal', action:'principal' },
      { label:'📚 Courses',   text:'Courses',   action:'courses'   },
      { label:'💰 Fees',      text:'Fees',       action:'fee'       },
      { label:'🏠 Hostel',    text:'Hostel',     action:'hostel'    },
      { label:'💼 Placement', text:'Placement',  action:'placement' },
      { label:'📋 Admission', text:'Admission',  action:'admission' },
      { label:'📞 Contact',   text:'Contact',    action:'contact'   },
    ]);
    convState = 'menu';
  }, delay);
}

/* ═══════════════════════════════════════════
   QUICK CHIPS
═══════════════════════════════════════════ */
window.quickAsk = function(action) {
  if (isStreaming) return;
  const labels = {
    principal:'🎓 Principal', courses:'📚 Courses', fee:'💰 Fees',
    hostel:'🏠 Hostel', placement:'💼 Placement', admission:'📋 Admission',
    library:'📖 Library', canteen:'🍽️ Canteen', transport:'🚌 Transport',
    contact:'📞 Contact', departments:'🏗️ Departments'
  };
  document.getElementById('quickChips').style.display = 'none';
  addUserMsg(labels[action] || action);
  processFlow(action);
};

window.onReplyChip = function(text, action) {
  if (isStreaming) return;
  addUserMsg(text);
  processFlow(action);
};

/* ═══════════════════════════════════════════
   CONVERSATION FLOW
═══════════════════════════════════════════ */
const HOSTEL_IMAGES = ['hostel_front.jpeg', 'hostel_building.jpeg', 'hostel_corridor.jpeg', 'hostel_mess.jpeg', 'hostel6.jpeg'];

function processFlow(action) {
  if (isStreaming) return;
  const lc = action.toLowerCase();

  /* HOSTEL - Show hostel images in background immediately */
  if (lc === 'hostel' || lc === 'girls_hostel' || lc.startsWith('h_')) {
    showImgBg(HOSTEL_IMAGES);
  }

  if (lc === 'hostel') {
    convState = 'hostel_type';
    showTyping();
    setTimeout(() => {
      hideTyping();
      const q = {
        en: '🏠 Which hostel do you want to know about?',
        hi: '🏠 किस हॉस्टल की जानकारी चाहिए?',
        mr: '🏠 कोणत्या वसतिगृहाबद्दल माहिती हवी?'
      }[currentLang];
      addBotMsg(q, null, [
        { label:'👧 Girls Hostel', text:'Girls Hostel', action:'girls_hostel' },
        { label:'👦 Boys Hostel',  text:'Boys Hostel',  action:'boys_hostel'  },
      ]);
    }, 300);
    return;
  }

  if (lc === 'girls_hostel') {
    convState = 'hostel_info';
    showTyping();
    setTimeout(() => {
      hideTyping();
      const q = {
        en: 'What would you like to know about <b>Girls Hostel</b>?',
        hi: '<b>गर्ल्स हॉस्टल</b> के बारे में क्या जानना है?',
        mr: '<b>मुलींच्या वसतिगृहा</b>बद्दल काय जाणून घ्यायचे?'
      }[currentLang];
      addBotMsg(q, HOSTEL_IMAGES, [
        { label:'🏠 Facilities', text:'Facilities', action:'h_fac'   },
        { label:'💰 Fees',       text:'Fees',       action:'h_fee'   },
        { label:'📜 Rules',      text:'Rules',      action:'h_rules' },
        { label:'📍 Location',   text:'Location',   action:'h_loc'   },
        { label:'📋 Full Info',  text:'Full Info',  action:'h_full'  },
      ]);
    }, 300);
    return;
  }

  if (lc === 'boys_hostel') {
    showTyping();
    setTimeout(() => {
      hideTyping();
      const msg = {
        en: '❌ COET Akola has only a <b>Girls Hostel</b> on campus.<br>Boys can find PG accommodation near college.<br><br>Want info about Girls Hostel?',
        hi: '❌ COET अकोला में केवल <b>गर्ल्स हॉस्टल</b> है।<br>लड़कों के लिए पास में PG उपलब्ध हैं।',
        mr: '❌ COET अकोलामध्ये फक्त <b>मुलींचे वसतिगृह</b> आहे.'
      }[currentLang];
      addBotMsg(msg, null, [{ label:'👧 Girls Hostel Info', text:'Girls Hostel', action:'girls_hostel' }]);
    }, 300);
    return;
  }

  if (lc === 'h_fac') {
    showTyping(); setTimeout(() => {
      hideTyping(); isStreaming = true;
      document.getElementById('sendBtn').disabled = true;
      const msg = {
        en: '🏠 <b>Girls Hostel Facilities:</b><br>• 24x7 Water Supply<br>• Wi-Fi Internet<br>• Mess (Hygienic food)<br>• Study Room<br>• CCTV Surveillance<br>• Warden 24/7<br>• Common Washroom<br>• Clean environment',
        hi: '🏠 <b>सुविधाएं:</b><br>• 24x7 पानी | WiFi | मेस | Study Room | CCTV | वार्डन 24/7',
        mr: '🏠 <b>सुविधा:</b><br>• 24x7 पाणी | WiFi | मेस | अभ्यास कक्ष | CCTV | वार्डन 24/7'
      }[currentLang];
      streamBotMessage(msg, HOSTEL_IMAGES, null, () => moreHelp());
    }, 300); return;
  }
  if (lc === 'h_fee') {
    showTyping(); setTimeout(() => {
      hideTyping(); isStreaming = true;
      document.getElementById('sendBtn').disabled = true;
      const msg = {
        en: '💰 <b>Girls Hostel Fee:</b><br>Annual Fee: <b>₹24,000</b> (Approx.)<br>Room Sharing: 4 girls per room',
        hi: '💰 <b>वार्षिक शुल्क:</b> ₹24,000 (लगभग)<br>4 लड़कियां/कमरा',
        mr: '💰 <b>वार्षिक शुल्क:</b> ₹24,000 (अंदाजे)<br>4 मुली/खोली'
      }[currentLang];
      streamBotMessage(msg, HOSTEL_IMAGES, null, () => moreHelp());
    }, 300); return;
  }
  if (lc === 'h_rules') {
    showTyping(); setTimeout(() => {
      hideTyping(); isStreaming = true;
      document.getElementById('sendBtn').disabled = true;
      const msg = {
        en: '📜 <b>Hostel Rules:</b><br>• Return by <b>8:30 PM</b> mandatory<br>• Parents visit: 6:00–8:00 PM only<br>• Zero tolerance to ragging',
        hi: '📜 <b>नियम:</b><br>• रात 8:30 बजे वापसी अनिवार्य<br>• Parents visit: 6–8 PM<br>• रैगिंग बिल्कुल नहीं',
        mr: '📜 <b>नियम:</b><br>• रात्री 8:30 पर्यंत परतणे<br>• पालक भेट: 6–8 PM<br>• रॅगिंग मनाई'
      }[currentLang];
      streamBotMessage(msg, HOSTEL_IMAGES, null, () => moreHelp());
    }, 300); return;
  }
  if (lc === 'h_loc') {
    showTyping(); setTimeout(() => {
      hideTyping(); isStreaming = true;
      document.getElementById('sendBtn').disabled = true;
      const msg = {
        en: '📍 <b>Location:</b> Inside Campus – Separate Block<br>Babhulgaon (Jh) NH No. 6, Akola – 444 104',
        hi: '📍 कैंपस अंदर – अलग ब्लॉक<br>बाभुळगाव (झ) NH No. 6, अकोला',
        mr: '📍 कॅम्पस आत – स्वतंत्र ब्लॉक<br>बाभूळगाव (झ) NH No. 6, अकोला'
      }[currentLang];
      streamBotMessage(msg, HOSTEL_IMAGES, null, () => moreHelp());
    }, 300); return;
  }
  if (lc === 'h_full') { fetchBackend('hostel'); return; }

  /* DEPARTMENTS */
  if (lc === 'departments') {
    convState = 'dept';
    showTyping();
    setTimeout(() => {
      hideTyping();
      const q = {
        en: '🏗️ Which department would you like to know about?',
        hi: '🏗️ कौनसा विभाग जानना चाहते हैं?',
        mr: '🏗️ कोणत्या विभागाबद्दल माहिती हवी?'
      }[currentLang];
      addBotMsg(q, null, [
        { label:'💻 CSE',        text:'CSE',        action:'dept_cse'  },
        { label:'🖥️ IT',         text:'IT',         action:'dept_it'   },
        { label:'🏗️ Civil',      text:'Civil',      action:'dept_civil'},
        { label:'⚙️ Mechanical', text:'Mechanical', action:'dept_mech' },
        { label:'🧪 Chemical',   text:'Chemical',   action:'dept_chem' },
        { label:'💼 MBA',        text:'MBA',        action:'dept_mba'  },
      ]);
    }, 600);
    return;
  }
  if (lc === 'dept_cse')   { fetchBackend('computer');               return; }
  if (lc === 'dept_it')    { fetchBackend('information technology'); return; }
  if (lc === 'dept_civil') { fetchBackend('civil');                  return; }
  if (lc === 'dept_mech')  { fetchBackend('mechanical');             return; }
  if (lc === 'dept_chem')  { fetchBackend('chemical');               return; }
  if (lc === 'dept_mba')   { fetchBackend('mba');                    return; }

  /* Everything else → PHP backend */
  fetchBackend(action);
}

/* ═══════════════════════════════════════════
   INSTANT LOCAL KNOWLEDGE BASE (0ms Latency)
═══════════════════════════════════════════ */
const LOCAL_QA = {
  principal: {
    keys: ['principal', 'director', 'thorat', 'प्राचार्य', 'डॉ थोरात'],
    en: '<b>🎓 Principal</b><br><b>Dr. P.V. Thorat</b><br><b>Qualification:</b> Ph.D. in Chemical Engineering, M.Tech<br><b>Phone:</b> 9960590202<br><b>College:</b> College of Engineering and Technology, Akola<br><b>Affiliated to:</b> Sant Gadge Baba Amravati University<br><b>Office Hours:</b> Mon-Sat, 10:00 AM – 4:00 PM',
    hi: '<b>🎓 प्राचार्य</b><br><b>डॉ. पी.व्ही. थोरात</b><br><b>योग्यता:</b> पीएच.डी. रासायनिक अभियांत्रिकी, एम.टेक<br><b>फोन:</b> 9960590202<br><b>कार्यालय समय:</b> सोम-शनि, सुबह 10 – शाम 4',
    mr: '<b>🎓 प्राचार्य</b><br><b>डॉ. पी.व्ही. थोरात</b><br><b>पात्रता:</b> पीएच.डी. रासायनिक अभियांत्रिकी, एम.टेक<br><b>फोन:</b> 9960590202<br><b>कार्यालय वेळ:</b> सोम-शनि, सकाळी 10 – सायंकाळी 4',
    imgs: null
  },
  courses: {
    keys: ['courses', 'course', 'branch', 'degree', 'अभ्यासक्रम', 'कोर्स'],
    en: '<b>📚 Courses Offered - COET Akola</b><br><br><b>U.G. Courses:</b><br>• B.E. Computer Science & Engg (180 seats)<br>• B.E. Information Technology (120 seats)<br>• B.E. Civil Engineering (60 seats)<br>• B.E. Mechanical Engineering (60 seats)<br>• B.E. Chemical Engineering (60 seats)<br>• B.Arch (Architecture)<br><br><b>P.G. & Other:</b><br>• MBA (60 seats)<br>• M.E. CSE / Chemical / Structural<br>• D.Arch (Diploma)',
    hi: '<b>📚 COET अकोला में उपलब्ध कोर्स:</b><br>• बी.ई. कंप्यूटर साइंस (180 सीटें)<br>• बी.ई. आईटी (120 सीटें)<br>• बी.ई. सिविल / मैकेनिकल / केमिकल<br>• बी.आर्क (वास्तुकला)<br>• MBA (60 सीटें)<br>• M.E. एवं डिप्लोमा',
    mr: '<b>📚 COET अकोला मधील अभ्यासक्रम:</b><br>• B.E. संगणक अभियांत्रिकी (180 जागा)<br>• B.E. माहिती तंत्रज्ञान (IT - 120 जागा)<br>• B.E. सिव्हिल / मेकॅनिकल / केमिकल<br>• B.Arch (वास्तुकला)<br>• MBA (60 जागा)<br>• M.E. आणि पदविका',
    imgs: null
  },
  fee: {
    keys: ['fee', 'fees', 'tuition', 'scholarship', 'शुल्क', 'फीस', 'शिष्यवृत्ती'],
    en: '<b>💰 Fee Structure 2025-2026 - COET Akola</b><br><br>• <b>B.E. First Year:</b> Open: ₹1,20,531 | OBC: ₹69,439 | SC/ST: ₹3,531<br>• <b>B.Arch:</b> Open: ₹1,19,264 | OBC: ₹67,937<br>• <b>MBA:</b> Open: ₹1,01,864 | OBC: ₹56,410<br>• <b>D.Arch:</b> Open: ₹47,454<br><br><b>Scholarships:</b> Available for SC, ST, OBC, EWS, and Girls TFWS scheme.',
    hi: '<b>💰 शुल्क संरचना 2025-2026:</b><br>• बी.ई. प्रथम वर्ष (Open): ₹1,20,531 | OBC: ₹69,439 | SC/ST: ₹3,531<br>• बी.आर्क: ₹1,19,264 | MBA: ₹1,01,864<br><b>छात्रवृत्ति:</b> SC, ST, OBC, EWS एवं TFWS उपलब्ध।',
    mr: '<b>💰 फी रचना 2025-2026:</b><br>• B.E. प्रथम वर्ष (Open): ₹1,20,531 | OBC: ₹69,439 | SC/ST: ₹3,531<br>• B.Arch: ₹1,19,264 | MBA: ₹1,01,864<br><b>शिष्यवृत्ती:</b> SC, ST, OBC, EWS आणि मुलींसाठी TFWS उपलब्ध.',
    imgs: null
  },
  hostel: {
    keys: ['hostel', 'dormitory', 'room', 'हॉस्टल', 'वसतिगृह', 'छात्रावास'],
    en: '<b>🏠 Hostel Facility - COET Akola</b><br><br><b>Girls Hostel:</b> Available inside campus.<br>• <b>Fee:</b> Approx ₹24,000 / year<br>• <b>Facilities:</b> 24x7 Security, CCTV, Wi-Fi, Hygienic Mess, Study Hall, RO Water.<br><b>Boys Hostel:</b> Private hostels & PGs available right outside campus gate.',
    hi: '<b>🏠 छात्रावास (हॉस्टल) सुविधा:</b><br><b>गर्ल्स हॉस्टल:</b> कैंपस के अंदर उपलब्ध (₹24,000/वर्ष)<br>सुविधाएं: 24x7 सुरक्षा, CCTV, Wi-Fi, मेस, RO पानी.<br><b>बॉयज हॉस्टल:</b> कॉलेज गेट के बाहर निजी हॉस्टल व पीजी उपलब्ध हैं।',
    mr: '<b>🏠 वसतिगृह सुविधा:</b><br><b>मुलींचे वसतिगृह:</b> कॅम्पसमध्ये उपलब्ध (अंदाजे ₹24,000/वर्ष)<br>सुविधा: 24x7 सुरक्षा, CCTV, Wi-Fi, मेस, RO पाणी.<br><b>मुलांचे वसतिगृह:</b> कॅम्पसबाहेर खाजगी वसतिगृह व PG उपलब्ध आहेत.',
    imgs: ['hostel_front.jpeg','hostel_building.jpeg','hostel_corridor.jpeg','hostel_mess.jpeg']
  },
  placement: {
    keys: ['placement', 'job', 'recruit', 'tcs', 'wipro', 'नौकरी', 'प्लेसमेंट', 'रोजगार'],
    en: '<b>💼 Placement Cell - COET Akola</b><br><br>• <b>Placements:</b> 350+ Students placed every year.<br>• <b>Top Recruiters:</b> TCS, Wipro, Capgemini, Infosys, Cognizant, Tech Mahindra.<br>• <b>Highest Package:</b> ₹8 - 10 LPA | <b>Average:</b> ₹3.5 - 4.5 LPA.<br>• Dedicated Training & Placement Cell with soft skills & aptitude sessions.',
    hi: '<b>💼 प्लेसमेंट सेल - COET अकोला</b><br>• 350+ छात्रों का प्रतिवर्ष प्लेसमेंट.<br>• प्रमुख कंपनियां: TCS, Wipro, Capgemini, Infosys.<br>• उच्चतम पैकेज: ₹8-10 LPA | औसत: ₹3.5-4.5 LPA.',
    mr: '<b>💼 प्लेसमेंट विभाग - COET अकोला</b><br>• दरवर्षी 350+ विद्यार्थ्यांचे प्लेसमेंट.<br>• प्रमुख कंपन्या: TCS, Wipro, Capgemini, Infosys.<br>• सर्वोच्च पॅकेज: ₹8-10 LPA | सरासरी: ₹3.5-4.5 LPA.',
    imgs: null
  },
  admission: {
    keys: ['admission', 'admissions', 'apply', 'eligibility', 'प्रवेश', 'दाखिला'],
    en: '<b>📋 Admission Procedure - COET Akola</b><br><br>• <b>Eligibility:</b> 12th (HSC) with PCM + MHT-CET / JEE Main score.<br>• <b>Process:</b> Through Maharashtra State CET Cell Centralized Admission Process (CAP).<br>• <b>College Code:</b> Institute Code available on DTE portal.<br>• <b>Helpline:</b> 9960590202 / Admissions Office.',
    hi: '<b>📋 प्रवेश प्रक्रिया:</b><br>• पात्रता: 12वीं PCM + MHT-CET या JEE Main स्कोर.<br>• प्रक्रिया: महाराष्ट्र CET Cell CAP राउंड के माध्यम से.<br>• अधिक जानकारी के लिए: 9960590202',
    mr: '<b>📋 प्रवेश प्रक्रिया:</b><br>• पात्रता: 12 वी PCM + MHT-CET किंवा JEE Main.<br>• प्रवेश: महाराष्ट्र CET Cell च्या CAP फेरीद्वारे.<br>• संपर्क: 9960590202',
    imgs: null
  },
  contact: {
    keys: ['contact', 'phone', 'location', 'address', 'संपर्क', 'फोन', 'पत्ता', 'स्थान', 'कहाँ है'],
    en: '<b>📞 Contact & Location - COET Akola</b><br><b>Address:</b> Babhulgaon (Jhiri), National Highway No. 6, Akola - 444104, Maharashtra.<br><b>Phone:</b> 9960590202<br><b>Email:</b> principal@coetakola.ac.in<br><b>Website:</b> https://coetakola.ac.in',
    hi: '<b>📞 संपर्क और पता:</b><br>बभुलगांव, राष्ट्रीय महामार्ग क्र. 6, अकोला - 444104.<br><b>फोन:</b> 9960590202 | <b>वेबसाइट:</b> https://coetakola.ac.in',
    mr: '<b>📞 संपर्क आणि पत्ता:</b><br>बाभूळगाव, राष्ट्रीय महामार्ग क्र. 6, अकोला - 444104.<br><b>फोन:</b> 9960590202 | <b>वेबसाईट:</b> https://coetakola.ac.in',
    imgs: null
  },
  canteen: {
    keys: ['canteen', 'food', 'mess', 'eat', 'कॅन्टीन', 'कैंटीन', 'खाना'],
    en: '<b>🍽️ Campus Canteen</b><br>Hygienic vegetarian breakfast, lunch, snacks, tea and coffee available at affordable student rates.',
    hi: '<b>🍽️ कॉलेज कैंटीन:</b><br>स्वच्छ शाकाहारी नाश्ता, भोजन और चाय-कॉफ़ी किफायती दरों पर उपलब्ध।',
    mr: '<b>🍽️ महाविद्यालय कॅन्टीन:</b><br>स्वच्छ आणि चवदार अल्पोपहार, जेवण आणि चहा-कॉफी सवलतीच्या दरात उपलब्ध.',
    imgs: ['canteen1.jpeg']
  },
  library: {
    keys: ['library', 'books', 'पुस्तकालय', 'ग्रंथालय'],
    en: '<b>📖 Central Library</b><br>Timings: 9:00 AM – 5:00 PM (Mon-Sat). 40,000+ technical books, national/international journals, e-library & reading hall.',
    hi: '<b>📖 केंद्रीय पुस्तकालय:</b><br>समय: सुबह 9 से शाम 5 बजे. 40,000+ पुस्तकें, जर्नल्स और डिजिटल ई-लाइब्रेरी.',
    mr: '<b>📖 मध्यवर्ती ग्रंथालय:</b><br>वेळ: सकाळी 9 ते संध्याकाळी 5. 40,000+ पुस्तके, मासिके आणि ई-लायब्ररी.',
    imgs: ['library1.jpeg']
  }
};

function findLocalAnswer(text, lang) {
  const t = text.toLowerCase();
  for (const item of Object.values(LOCAL_QA)) {
    for (const k of item.keys) {
      if (t.includes(k)) {
        return { reply: item[lang] || item.en, imgs: item.imgs };
      }
    }
  }
  return null;
}

/* ═══════════════════════════════════════════
   BACKEND FETCH (PHP + MySQL)
═══════════════════════════════════════════ */
function fetchBackend(msg) {
  if (isStreaming) return;
  isStreaming = true;
  document.getElementById('sendBtn').disabled = true;

  // 1. Instant Zero-Latency Response for common topics
  const localMatch = findLocalAnswer(msg, currentLang);
  if (localMatch) {
    if (localMatch.imgs && localMatch.imgs.length) showImgBg(localMatch.imgs); else restoreVideo();
    streamBotMessage(localMatch.reply, localMatch.imgs, null, () => moreHelp());
    return;
  }

  showTyping();

  // Bulletproof dynamic API URL resolution:
  // Supports custom Render/external backend URL or automatic relative path
  const API_URL = (function() {
    if (window.COET_API_URL) {
      return window.COET_API_URL;
    }
    const loc = window.location;
    // When hosted on Vercel, forward API calls to the Render backend service
    if (loc.hostname.includes('vercel.app')) {
      return 'https://collage-chatbot.onrender.com/backend/chat.php';
    }
    if (loc.pathname.includes('/frontend/')) {
      return '../backend/chat.php';
    }
    const base = loc.pathname.substring(0, loc.pathname.lastIndexOf('/') + 1);
    return base + 'backend/chat.php';
  })();

  fetch(API_URL, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ message: msg, lang: currentLang })
  })
  .then(async r => {
    let data = null;
    try {
      data = await r.json();
    } catch (e) {
      data = null;
    }
    return { ok: r.ok, data: data };
  })
  .then(res => {
    hideTyping();
    const data = res.data;
    if (!data) {
      isStreaming = false;
      document.getElementById('sendBtn').disabled = false;
      addBotMsg("⚠️ <b>सर्व्हर एरर / Server Error</b><br>सर्व्हरकडून योग्य प्रतिसाद मिळाला नाही. कृपया पुन्हा प्रयत्न करा.");
      return;
    }

    const imgs = data.image
      ? data.image.split(",").map(s => s.trim()).filter(Boolean)
      : null;
    const replyText = data.reply || (data.error ? `⚠️ <b>${data.error}</b>` : "Sorry, no information found.");

    if (imgs && imgs.length) showImgBg(imgs); else restoreVideo();

    streamBotMessage(replyText, imgs, null, () => moreHelp());
  })
  .catch(() => {
    hideTyping();
    isStreaming = false;
    document.getElementById('sendBtn').disabled = false;
    addBotMsg("⚠️ <b>सर्व्हरशी संपर्क होऊ शकला नाही / Server not connected</b><br>कृपया Apache आणि MySQL चालू असल्याची खात्री करा किंवा इंटरनेट कनेक्शन तपासा.");
  });
}

/* ═══════════════════════════════════════════
   SEND MESSAGE
═══════════════════════════════════════════ */
window.sendMessage = function() {
  if (isStreaming) return;
  const inp = document.getElementById('userMsg');
  const msg = inp.value.trim();
  if (!msg) return;

  document.getElementById('quickChips').style.display = 'none';
  addUserMsg(msg);
  inp.value = '';

  const lc = msg.toLowerCase();

  if (/hostel/.test(lc))     { processFlow('hostel');      return; }
  if (/department|विभाग/.test(lc)) { processFlow('departments'); return; }

  if (convState === 'hostel_type') {
    if (/girl|lady|महिला|मुलीं|👧/.test(lc)) { processFlow('girls_hostel'); return; }
    if (/boy|male|पुरुष|मुलां|👦/.test(lc))  { processFlow('boys_hostel');  return; }
  }
  if (convState === 'hostel_info') {
    if (/facilit|सुविधा/.test(lc)) { processFlow('h_fac');   return; }
    if (/fee|शुल्क|फीस/.test(lc))  { processFlow('h_fee');   return; }
    if (/rule|नियम/.test(lc))       { processFlow('h_rules'); return; }
    if (/location|स्थान/.test(lc))  { processFlow('h_loc');   return; }
  }
  if (convState === 'dept') {
    if (/cse|computer/.test(lc))     { processFlow('dept_cse');   return; }
    if (/\bit\b|information/.test(lc)){ processFlow('dept_it');   return; }
    if (/civil/.test(lc))            { processFlow('dept_civil'); return; }
    if (/mechanical/.test(lc))       { processFlow('dept_mech');  return; }
    if (/chemical/.test(lc))         { processFlow('dept_chem');  return; }
    if (/mba/.test(lc))              { processFlow('dept_mba');   return; }
  }

  convState = 'menu';
  fetchBackend(msg);
};

/* ═══════════════════════════════════════════
   BACKGROUND SWITCHER
═══════════════════════════════════════════ */
let imgInterval = null;

function showImgBg(images) {
  if (!images || !images.length) return;
  clearInterval(imgInterval);
  if (bgVideo) {
    bgVideo.pause();
    bgVideo.style.display = 'none';
  }
  let idx = 0;
  const hero = document.getElementById('heroSection');
  if (!hero) return;
  function set() {
    const imgName = images[idx].trim();
    hero.style.backgroundImage = `url('images/${imgName}')`;
    hero.style.backgroundSize = 'cover';
    hero.style.backgroundPosition = 'center';
    hero.style.transition = 'background-image 0.8s ease-in-out';
  }
  set();
  if (images.length > 1) {
    imgInterval = setInterval(() => {
      idx = (idx + 1) % images.length;
      set();
    }, 3200);
  }
}

function restoreVideo() {
  clearInterval(imgInterval);
  const hero = document.getElementById('heroSection');
  if (hero) hero.style.backgroundImage = '';
  if (bgVideo) {
    bgVideo.style.display = 'block';
    bgVideo.style.opacity = '1';
    playVideo(videoIdx, false);
  }
}

/* ═══════════════════════════════════════════
   MINIMIZE / OPEN
═══════════════════════════════════════════ */
window.minimizeChat = function() {
  document.getElementById('chatCard').style.display = 'none';
  document.getElementById('fabWrap').style.display  = 'flex';
};
window.openChat = function() {
  document.getElementById('chatCard').style.display = 'flex';
  document.getElementById('fabWrap').style.display  = 'none';
};

/* ═══════════════════════════════════════════
   IMAGE POPUP
═══════════════════════════════════════════ */
window.openImg = function(src) {
  const p = document.createElement('div');
  p.className = 'img-popup';
  p.innerHTML  = `<img src="${src}">`;
  p.onclick    = () => p.remove();
  document.body.appendChild(p);
};

/* ═══════════════════════════════════════════
   VOICE INPUT (MIC)
═══════════════════════════════════════════ */
let recog = null, isListening = false;

window.startVoice = function() {
  if (!('SpeechRecognition' in window) && !('webkitSpeechRecognition' in window)) {
    document.getElementById('micStatus').textContent = '❌ Use Chrome for voice';
    return;
  }
  if (isListening) { recog.stop(); return; }
  const SR = window.SpeechRecognition || window.webkitSpeechRecognition;
  recog = new SR();
  recog.lang = currentLang === 'en' ? 'en-IN' : currentLang === 'hi' ? 'hi-IN' : 'mr-IN';
  recog.onstart  = () => {
    isListening = true;
    document.getElementById('micBtn').classList.add('listening');
    document.getElementById('micStatus').textContent = {
      en:'🎤 Listening...', hi:'🎤 बोलिए...', mr:'🎤 बोला...'
    }[currentLang];
  };
  recog.onresult = e => {
    document.getElementById('userMsg').value = e.results[0][0].transcript;
    sendMessage();
  };
  recog.onerror  = e => {
    document.getElementById('micStatus').textContent = '❌ ' + e.error;
    setTimeout(() => document.getElementById('micStatus').textContent = '', 3000);
  };
  recog.onend    = () => {
    isListening = false;
    document.getElementById('micBtn').classList.remove('listening');
    setTimeout(() => document.getElementById('micStatus').textContent = '', 1500);
  };
  recog.start();
};

/* ═══════════════════════════════════════════
   GREETING (with stream animation)
═══════════════════════════════════════════ */
setTimeout(() => {
  isStreaming = true;
  document.getElementById('sendBtn').disabled = true;
  const greet = {
    en: '👋 Hello! Welcome to <b>COET Akola Bot!</b><br><br>I can help you with information about:<br>🎓 Principal · 📚 Courses · 💰 Fees · 🏠 Hostel<br>📖 Library · 🍽️ Canteen · 💼 Placement · 📋 Admission<br><br>What would you like to know? 😊',
    hi: '👋 नमस्ते! <b>COET अकोला बॉट</b> में आपका स्वागत!<br><br>मैं आपको बता सकता हूं: प्राचार्य, कोर्स, फीस, हॉस्टल, लाइब्रेरी, कैंटीन, प्लेसमेंट, एडमिशन<br><br>क्या जानना है? 😊',
    mr: '👋 नमस्कार! <b>COET अकोला बॉट</b>मध्ये स्वागत!<br><br>मी मदत करू शकतो: प्राचार्य, अभ्यासक्रम, शुल्क, वसतिगृह, ग्रंथालय, कॅन्टीन, प्लेसमेंट, प्रवेश<br><br>काय जाणून घ्यायचे? 😊'
  }[currentLang];

  // Small delay for a nice entrance
  setTimeout(() => {
    streamBotMessage(greet);
  }, 200);
}, 600);

}); // end DOMContentLoaded
/* ══ SMART GREETING SYSTEM ══ */
(function SmartGreeting() {
  let greetLang = 'en';
  const bl = (navigator.language || 'en').toLowerCase();
  if (bl.startsWith('hi')) greetLang = 'hi';
  else if (bl.startsWith('mr')) greetLang = 'mr';
  highlightLangBtn(greetLang);

  // Visitor counter
  const today = new Date().toDateString();
  const d = JSON.parse(localStorage.getItem('coet_visit') || '{"date":"","count":0}');
  const cnt = d.date === today ? d.count + 1 : 1;
  localStorage.setItem('coet_visit', JSON.stringify({date: today, count: cnt}));
  const vcEl = document.getElementById('visitorCount');
  if (vcEl) { let n=0; const ti=setInterval(()=>{ n+=2; vcEl.textContent=Math.min(n,118+cnt); if(n>=118+cnt)clearInterval(ti); },30); }

  // Particles
  const pc = document.getElementById('greetParticles');
  if (pc) for (let i=0;i<18;i++) { const p=document.createElement('div'); p.className='particle'; const s=Math.random()*5+2; p.style.cssText=`width:${s}px;height:${s}px;left:${Math.random()*100}%;animation-duration:${4+Math.random()*8}s;animation-delay:${Math.random()*6}s`; pc.appendChild(p); }

  function highlightLangBtn(l) {
    ['en','hi','mr'].forEach(x => { const b=document.getElementById('gl_'+x); if(b) b.classList.toggle('active', x===l); });
  }

  const msgs = {
    en: { student:{h:'👋 Welcome, Future Engineer! 🎓',s:'Explore COET Akola — <span style="color:#4fc3f7">Vidarbha\'s finest engineering college!</span> ✨',e:'Enter College Portal →'},parent:{h:'🙏 Warm Welcome, Dear Guardian!',s:'We\'re honored. Let us guide you through <span style="color:#4fc3f7">COET Akola</span> — admissions, fees & more.',e:'Discover COET Akola →'},def:{h:'👋 Welcome to COET Akola! 🎓',s:'Your AI campus guide is ready.<br>Ask about <span style="color:#4fc3f7">admission, fees, hostel & more!</span>',e:'Start Exploring →'} },
    hi: { student:{h:'👋 स्वागत है, भविष्य के इंजीनियर! 🎓',s:'COET अकोला explore करें — <span style="color:#4fc3f7">विदर्भ का सर्वश्रेष्ठ कॉलेज!</span> ✨',e:'कॉलेज पोर्टल में जाएं →'},parent:{h:'🙏 आदरणीय अभिभावक, सुस्वागतम!',s:'<span style="color:#4fc3f7">COET अकोला</span> — प्रवेश, शुल्क, सुविधाएं सब जानें।',e:'COET अकोला देखें →'},def:{h:'👋 COET अकोला में स्वागत! 🎓',s:'AI कैंपस गाइड तैयार है।<br><span style="color:#4fc3f7">प्रवेश, शुल्क, हॉस्टल</span> — सब पूछें!',e:'जानना शुरू करें →'} },
    mr: { student:{h:'👋 स्वागत आहे, भावी अभियंता! 🎓',s:'COET अकोला — <span style="color:#4fc3f7">विदर्भातील सर्वोत्तम महाविद्यालय!</span> ✨',e:'कॉलेज पोर्टलमध्ये जा →'},parent:{h:'🙏 आदरणीय पालक, सुस्वागतम!',s:'<span style="color:#4fc3f7">COET अकोला</span> — प्रवेश, शुल्क, सुविधा सर्व.',e:'COET अकोला पहा →'},def:{h:'👋 COET अकोलामध्ये स्वागत! 🎓',s:'AI कॅम्पस गाइड तयार आहे।<br><span style="color:#4fc3f7">प्रवेश, शुल्क, वसतिगृह</span> — सर्व विचारा!',e:'जाणून घ्या →'} }
  };

  let detAge=null, detGender=null;

  function getMsg(age, gender) {
    const s = msgs[greetLang] || msgs.en;
    if (age && age < 30) return s.student;
    if (age && age >= 30) return s.parent;
    return s.def;
  }

  let isGreetShown = false;

  function showGreetMsg(age, gender) {
    if (isGreetShown) return;
    isGreetShown = true;
    detAge=age; detGender=gender;
    const m = getMsg(age, gender);
    const detEl = document.getElementById('greetDetecting');
    if (detEl) detEl.style.display = 'none';
    const box = document.getElementById('greetMessageBox'); 
    if (box) box.style.display = 'block';
    const helloEl = document.getElementById('greetHello');
    if (helloEl) helloEl.textContent = m.h;
    const subEl = document.getElementById('greetSub');
    if (subEl) subEl.innerHTML = m.s;
    const enterEl = document.getElementById('greetEnterText');
    if (enterEl) enterEl.textContent = m.e;
    setTimeout(() => speak(m.h + '. ' + m.s.replace(/<[^>]*>/g,'')), 400);
  }

  function speak(txt) {
    if (!window.speechSynthesis) return;
    try {
      window.speechSynthesis.cancel();
      const u = new SpeechSynthesisUtterance(txt);
      u.lang = greetLang==='hi' ? 'hi-IN' : greetLang==='mr' ? 'mr-IN' : 'en-IN';
      u.rate=0.88; u.pitch=1.15; u.volume=0.92;
      const vs = window.speechSynthesis.getVoices();
      const pick = vs.find(v=>v.lang.startsWith(u.lang.split('-')[0])) || vs.find(v=>v.lang.startsWith('en'));
      if (pick) u.voice = pick;
      const body = document.getElementById('botAvatarBody');
      const wav  = document.getElementById('speakWaves');
      u.onstart = () => { body&&body.classList.add('talking'); wav&&wav.classList.add('active'); };
      u.onend = u.onerror = () => { body&&body.classList.remove('talking'); wav&&wav.classList.remove('active'); };
      if (!vs.length) { window.speechSynthesis.onvoiceschanged = () => window.speechSynthesis.speak(u); }
      else window.speechSynthesis.speak(u);
    } catch(e) {}
  }

  window.setGreetLang = function(l) {
    greetLang = l; highlightLangBtn(l);
    if (document.getElementById('greetHello').textContent) {
      const m = getMsg(detAge, detGender);
      document.getElementById('greetHello').textContent = m.h;
      document.getElementById('greetSub').innerHTML = m.s;
      document.getElementById('greetEnterText').textContent = m.e;
      speak(m.h + '. ' + m.s.replace(/<[^>]*>/g,''));
    }
  };

  window.closeGreeting = function() {
    window.speechSynthesis && window.speechSynthesis.cancel();
    const ov = document.getElementById('greetingOverlay');
    ov.classList.add('hide');
    setTimeout(() => { ov.style.display='none'; }, 700);
  };

  // Face detection
  async function startFaceDetection() {
    // 2.0s fast fallback guarantee so visitor sees greeting quickly
    const fallbackTimer = setTimeout(() => {
      showGreetMsg(null, null);
    }, 2000);

    // Pre-warm backend in background immediately
    try {
      fetch('https://collage-chatbot.onrender.com/backend/chat.php', { method: 'OPTIONS' }).catch(() => {});
    } catch(e) {}

    const lbl = document.getElementById('detectLabel');
    if (typeof faceapi === 'undefined') { 
      setTimeout(() => {
        clearTimeout(fallbackTimer);
        showGreetMsg(null, null);
      }, 1000); 
      return; 
    }

    try {
      if(lbl) lbl.textContent = 'Loading AI...';
      const MODEL_URL = 'https://cdn.jsdelivr.net/gh/cgarciagl/face-api.js@0.22.2/weights/';
      await Promise.all([
        faceapi.nets.tinyFaceDetector.loadFromUri(MODEL_URL), 
        faceapi.nets.ageGenderNet.loadFromUri(MODEL_URL)
      ]);

      if(lbl) lbl.textContent = 'Starting camera...';
      const video = document.getElementById('faceVideo');
      if (!video || !navigator.mediaDevices || !navigator.mediaDevices.getUserMedia) {
        clearTimeout(fallbackTimer);
        showGreetMsg(null, null);
        return;
      }

      const stream = await navigator.mediaDevices.getUserMedia({
        video: { width: 320, height: 240, facingMode: 'user' },
        audio: false
      });
      video.srcObject = stream; 
      await video.play();

      if(lbl) lbl.textContent = 'Detecting... 👁️';
      let attempts = 0;
      const detect = async () => {
        attempts++;
        try {
          const result = await faceapi.detectSingleFace(video, new faceapi.TinyFaceDetectorOptions()).withAgeAndGender();
          if (result) { 
            clearTimeout(fallbackTimer);
            stream.getTracks().forEach(t=>t.stop()); 
            showGreetMsg(Math.round(result.age), result.gender); 
          }
          else if (attempts < 8) setTimeout(detect, 400);
          else { 
            clearTimeout(fallbackTimer);
            stream.getTracks().forEach(t=>t.stop()); 
            showGreetMsg(null, null); 
          }
        } catch(err) {
          clearTimeout(fallbackTimer);
          stream.getTracks().forEach(t=>t.stop());
          showGreetMsg(null, null);
        }
      };
      setTimeout(detect, 500);
    } catch(e) { 
      clearTimeout(fallbackTimer);
      showGreetMsg(null, null); 
    }
  }

  window.addEventListener('load', () => setTimeout(startFaceDetection, 600));
})();
