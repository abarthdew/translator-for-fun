<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js consumer" lang="en">
<head>
  <script>
    (function (e, p) {
      var m = location.href.match(/platform=(win8|win|mac|linux|cros)/);
      e.id = (m && m[1]) ||
        (p.indexOf('Windows NT 6.2') > -1 ? 'win8' : p.indexOf('Windows') > -1 ? 'win' : p.indexOf('Mac') > -1 ? 'mac' : p.indexOf('CrOS') > -1 ? 'cros' : 'linux');
      e.className = e.className.replace(/\bno-js\b/, 'js');
    })(document.documentElement, window.navigator.userAgent)
  </script>
  <meta charset="utf-8">
  <meta content="initial-scale=1, minimum-scale=1, width=device-width" name="viewport">
  <meta content=
          "Google Chrome is a browser that combines a minimal design with sophisticated technology to make the web faster, safer, and easier."
        name="description">
  <title>
    Translator for Benjamin
  </title>
  <!-- jquery -->
  <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
  <link href="https://plus.google.com/100585555255542998765" rel="publisher">
  <link href="//www.google.com/images/icons/product/chrome-32.png" rel="icon" type="image/ico">
  <link href="//fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&amp;subset=latin" rel=
    "stylesheet">
  <link href="/intl/en/chrome/assets/common/css/chrome.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css">
  <script src="//www.google.com/js/gweb/analytics/autotrack.js"></script>
  <script>
    new gweb.analytics.AutoTrack({
      profile: 'UA-26908291-1'
    });
  </script>
  <style>
    @import url('https://fonts.googleapis.com/css?family=Audiowide|Nanum+Myeongjo|Orbitron:700|Orbitron|Song+Myung|Syncopate|Nanum+Gothic');

    * {
      margin: 0px auto;
      text-align: center;
      text-decoration: none;
      color: #000;
    }

    body {
      margin-top: 50px;
    }

    #info {
      font-size: 20px;
    }

    h1 {
      margin-bottom: 50px;
      font-family: Orbitron;
    }

    p {
      font-family: Nanum Gothic;
    }

    #div_start {
      float: right;
    }

    #headline {
      text-decoration: none;
    }

    #results {
      font-size: 14px;
      font-weight: bold;
      border: 1px solid #ddd;
      padding: 15px;
      text-align: left;
      height: 200px;
      overflow-y: auto;
      max-width: 800px;
      margin: 50px auto;
      box-shadow: 0 5px 10px -5px #333;
    }

    #start_button {
      border: 0;
      background-color: transparent;
      padding: 0;
      cursor: pointer;
    }

    #start_button > img {
      width: 40px;
      height: 40px;
    }

    #start_button:focus {
      outline: none;
    }

    .interim {
      color: gray;
    }

    .final {
      color: black;
      padding-right: 3px;
    }

    .button {
      display: none;
    }

    .marquee {
      margin: 20px auto;
    }

    .bounceIn {
      -webkit-animation-duration: 0.75s;
      animation-duration: 0.75s;
      -webkit-animation-name: bounceIn;
      animation-name: bounceIn;
      animation-duration: 3s;
      animation-iteration-count: infinite;
    }

    .select_lang {
      width: 190px;
      height: 35px;
      font-size: 16px;
    }

    #copy_button {
      width: 200px;
      height: 40px;
      background: #fff; /*linear-gradient(-90deg, #FE9A2E, #FFBF00); */
      border: none;
      border-radius: 5px;
      margin-bottom: 20px;
      font-size: 16px;
      font-weight: bold;
      font-family: Nanum Gothic;
      box-shadow: 1px 2px 9px 5px #999;
      cursor: pointer;
    }

    #append {
      border: 1px solid #ddd;
      padding: 15px;
      text-align: left;
      height: 300px;
      overflow-y: auto;
      max-width: 800px;
      margin: 50px auto;
      text-align: left;
    }

    #btn {
      float: right;
      margin-right: 10px;
      cursor: pointer;
    }

    textarea {
      display: none;
    }
  </style>
  <style>
    a.c1 {
      font-weight: normal;
    }
  </style>
</head>
<body class="" id="grid">
<div class="browser-landing" id="main">
  <div class="compact marquee">
    <div id="info">
      <p id="info_start">
        click the button before you speak...
      </p>
      <p id="info_speak_now" style="display:none">
        now speak!
      </p>
    </div>
    <div id="results">
      <div id="div_start">
        <button id="start_button" onclick="startButton(event)">
          <img class="" alt="Start" id="start_img" src="https://image.flaticon.com/icons/png/512/440/440815.png">
        </button>
      </div>
      <span class="final" id="final_span" contenteditable="true"></span> <span class="interim" id=
      "interim_span"></span>
    </div>
    <div id="copy">
      <button class="button" id="copy_button">translate</button>
    </div>
    <div class="compact marquee" id="div_language">
      <select id="select_language" class="select_lang" onchange="updateCountry()"></select>&nbsp;&nbsp;
      <select id="select_dialect" class="select_lang"></select>
    </div>
    <textarea></textarea>
    <div id="append">
      <span id="btn"><img
        src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/VisualEditor_-_Icon_-_Arched-arrow-ltr.svg/1024px-VisualEditor_-_Icon_-_Arched-arrow-ltr.svg.png"
        width="35" height="35" alt="(copy)""></span>
    </div>
  </div>
</div>
<script src="/intl/en/chrome/assets/common/js/chrome.min.js"></script>
<script>
  var chrmMenuBar = new chrm.ui.MenuBar();
  chrmMenuBar.decorate('nav');
  var chrmLogo = new chrm.ui.Logo('logo');
  var chrmscroll = new chrm.ui.SmoothScroll('scroll');
  chrmscroll.init();
  window.___gcfg = {lang: 'en'};
  (function () {
    var po = document.createElement('script');
    po.type = 'text/javascript';
    po.async = true;
    po.src = 'https://apis.google.com/js/plusone.js';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(po, s);
  })();
  var doubleTracker = new gweb.analytics.DoubleTrack('floodlight', {
    src: 2542116,
    type: 'clien612',
    cat: 'chrom0'
  });
  doubleTracker.track();
  doubleTracker.trackClass('doubletrack', true);
</script>

<script>
  // If you modify this array, also update default language / dialect below.
  var langs =
    [['Afrikaans', ['af-ZA']],
      ['አማርኛ', ['am-ET']],
      ['Azərbaycanca', ['az-AZ']],
      ['বাংলা', ['bn-BD', 'বাংলাদেশ'],
        ['bn-IN', 'ভারত']],
      ['Bahasa Indonesia', ['id-ID']],
      ['Bahasa Melayu', ['ms-MY']],
      ['Català', ['ca-ES']],
      ['Čeština', ['cs-CZ']],
      ['Dansk', ['da-DK']],
      ['Deutsch', ['de-DE']],
      ['English', ['en-AU', 'Australia'],
        ['en-CA', 'Canada'],
        ['en-IN', 'India'],
        ['en-KE', 'Kenya'],
        ['en-TZ', 'Tanzania'],
        ['en-GH', 'Ghana'],
        ['en-NZ', 'New Zealand'],
        ['en-NG', 'Nigeria'],
        ['en-ZA', 'South Africa'],
        ['en-PH', 'Philippines'],
        ['en-GB', 'United Kingdom'],
        ['en-US', 'United States']],
      ['Español', ['es-AR', 'Argentina'],
        ['es-BO', 'Bolivia'],
        ['es-CL', 'Chile'],
        ['es-CO', 'Colombia'],
        ['es-CR', 'Costa Rica'],
        ['es-EC', 'Ecuador'],
        ['es-SV', 'El Salvador'],
        ['es-ES', 'España'],
        ['es-US', 'Estados Unidos'],
        ['es-GT', 'Guatemala'],
        ['es-HN', 'Honduras'],
        ['es-MX', 'México'],
        ['es-NI', 'Nicaragua'],
        ['es-PA', 'Panamá'],
        ['es-PY', 'Paraguay'],
        ['es-PE', 'Perú'],
        ['es-PR', 'Puerto Rico'],
        ['es-DO', 'República Dominicana'],
        ['es-UY', 'Uruguay'],
        ['es-VE', 'Venezuela']],
      ['Euskara', ['eu-ES']],
      ['Filipino', ['fil-PH']],
      ['Français', ['fr-FR']],
      ['Basa Jawa', ['jv-ID']],
      ['Galego', ['gl-ES']],
      ['ગુજરાતી', ['gu-IN']],
      ['Hrvatski', ['hr-HR']],
      ['IsiZulu', ['zu-ZA']],
      ['Íslenska', ['is-IS']],
      ['Italiano', ['it-IT', 'Italia'],
        ['it-CH', 'Svizzera']],
      ['ಕನ್ನಡ', ['kn-IN']],
      ['ភាសាខ្មែរ', ['km-KH']],
      ['Latviešu', ['lv-LV']],
      ['Lietuvių', ['lt-LT']],
      ['മലയാളം', ['ml-IN']],
      ['मराठी', ['mr-IN']],
      ['Magyar', ['hu-HU']],
      ['ລາວ', ['lo-LA']],
      ['Nederlands', ['nl-NL']],
      ['नेपाली भाषा', ['ne-NP']],
      ['Norsk bokmål', ['nb-NO']],
      ['Polski', ['pl-PL']],
      ['Português', ['pt-BR', 'Brasil'],
        ['pt-PT', 'Portugal']],
      ['Română', ['ro-RO']],
      ['සිංහල', ['si-LK']],
      ['Slovenščina', ['sl-SI']],
      ['Basa Sunda', ['su-ID']],
      ['Slovenčina', ['sk-SK']],
      ['Suomi', ['fi-FI']],
      ['Svenska', ['sv-SE']],
      ['Kiswahili', ['sw-TZ', 'Tanzania'],
        ['sw-KE', 'Kenya']],
      ['ქართული', ['ka-GE']],
      ['Հայերեն', ['hy-AM']],
      ['தமிழ்', ['ta-IN', 'இந்தியா'],
        ['ta-SG', 'சிங்கப்பூர்'],
        ['ta-LK', 'இலங்கை'],
        ['ta-MY', 'மலேசியா']],
      ['తెలుగు', ['te-IN']],
      ['Tiếng Việt', ['vi-VN']],
      ['Türkçe', ['tr-TR']],
      ['اُردُو', ['ur-PK', 'پاکستان'],
        ['ur-IN', 'بھارت']],
      ['Ελληνικά', ['el-GR']],
      ['български', ['bg-BG']],
      ['Pусский', ['ru-RU']],
      ['Српски', ['sr-RS']],
      ['Українська', ['uk-UA']],
      ['한국어', ['ko-KR']],
      ['中文', ['cmn-Hans-CN', '普通话 (中国大陆)'],
        ['cmn-Hans-HK', '普通话 (香港)'],
        ['cmn-Hant-TW', '中文 (台灣)'],
        ['yue-Hant-HK', '粵語 (香港)']],
      ['日本語', ['ja-JP']],
      ['हिन्दी', ['hi-IN']],
      ['ภาษาไทย', ['th-TH']]];
  for (var i = 0; i < langs.length; i++) {
    select_language.options[i] = new Option(langs[i][0], i);
  }
  // Set default language / dialect.
  select_language.selectedIndex = 55;
  updateCountry();
  select_dialect.selectedIndex = 11;
  showInfo('info_start');

  function updateCountry() {
    for (var i = select_dialect.options.length - 1; i >= 0; i--) {
      select_dialect.remove(i);
    }
    var list = langs[select_language.selectedIndex];
    for (var i = 1; i < list.length; i++) {
      select_dialect.options.add(new Option(list[i][1], list[i][0]));
    }
    select_dialect.style.display = list[1].length == 1 ? 'none' : 'inline-block';
  }

  var create_email = false;
  var final_transcript = '';
  var recognizing = false;
  var ignore_onend;
  var start_timestamp;
  if (!('webkitSpeechRecognition' in window)) {
    upgrade();
  } else {
    start_button.style.display = 'inline-block';
    var recognition = new webkitSpeechRecognition();
    recognition.continuous = true;
    recognition.interimResults = true;
    recognition.onstart = function () {
      recognizing = true;
      showInfo('info_speak_now');
      start_img.src = 'https://yt3.ggpht.com/a/AGF-l78z9oO9eD3eupnCRad7KockzUVmw3yGrAqI6g=s900-mo-c-c0xffffffff-rj-k-no';
      start_img.setAttribute('class', 'bounceIn');
    };
    recognition.onend = function () {
      recognizing = false;
      if (ignore_onend) {
        return;
      }
      start_img.src = 'https://image.flaticon.com/icons/png/512/440/440815.png';
      start_img.setAttribute('class', '');
      if (!final_transcript) {
        showInfo('info_start');
        return;
      }
      showInfo('info_start');
      if (window.getSelection) {
        window.getSelection().removeAllRanges();
        var range = document.createRange();
        range.selectNode(document.getElementById('final_span'));
        window.getSelection().addRange(range);
      }
      if (create_email) {
        create_email = false;
        createEmail();
      }
    };
    recognition.onresult = function (event) {
      var interim_transcript = '';
      if (typeof (event.results) == 'undefined') {
        recognition.onend = null;
        recognition.stop();
        upgrade();
        return;
      }
      for (var i = event.resultIndex; i < event.results.length; ++i) {
        if (event.results[i].isFinal) {
          final_transcript += event.results[i][0].transcript;
        } else {
          interim_transcript += event.results[i][0].transcript;
        }
      }
      final_transcript = capitalize(final_transcript);
      final_span.innerHTML = linebreak(final_transcript);
      interim_span.innerHTML = linebreak(interim_transcript);
      if (final_transcript || interim_transcript) {
        showButtons('inline-block');
      }
    };
  }

  function upgrade() {
    start_button.style.visibility = 'hidden';
    showInfo('info_upgrade');
  }

  var two_line = /\n\n/g;
  var one_line = /\n/g;

  function linebreak(s) {
    return s.replace(two_line, '<p></p>').replace(one_line, '<br>');
  }

  var first_char = /\S/;

  function capitalize(s) {
    return s.replace(first_char, function (m) {
      return m.toUpperCase();
    });
  }

  function createEmail() {
    var n = final_transcript.indexOf('\n');
    if (n < 0 || n >= 80) {
      n = 40 + final_transcript.substring(40).indexOf(' ');
    }
    var subject = encodeURI(final_transcript.substring(0, n));
    var body = encodeURI(final_transcript.substring(n + 1));
    window.location.href = 'mailto:?subject=' + subject + '&body=' + body;
  }

  function startButton(event) {
    if (recognizing) {
      recognition.stop();
      return;
    }
    final_transcript = '';
    recognition.lang = select_dialect.value;
    recognition.start();
    ignore_onend = false;
    final_span.innerHTML = '';
    interim_span.innerHTML = '';
    start_img.src = '/intl/en/chrome/assets/common/images/content/mic-slash.gif';
    showInfo('info_allow');
    showButtons('none');
    start_timestamp = event.timeStamp;
  }

  function showInfo(s) {
    if (s) {
      for (var child = info.firstChild; child; child = child.nextSibling) {
        if (child.style) {
          child.style.display = child.id == s ? 'inline' : 'none';
        }
      }
      info.style.visibility = 'visible';
    } else {
      info.style.visibility = 'hidden';
    }
  }

  var current_style;

  function showButtons(style) {
    if (style == current_style) {
      return;
    }
    current_style = style;
    copy_button.style.display = style;
  }

  //        날짜, 시간
  var d = new Date();
  var currentDate = d.getFullYear() + "년 " + (d.getMonth() + 1) + "월 " + d.getDate() + "일";
  var currentTime = d.getHours() + "시 " + d.getMinutes() + "분 " + d.getSeconds() + "초";
  $("#append").append(currentDate + " / " + currentTime + "<br><hr><br>");

  //        버튼
  $("#copy_button").on("click", function () {
    $.ajax({
      url: "/translate",
      type: "post",
      data: {key: $("#final_span").text()}
    }).done(function (resp) {
      $("#append").append(resp + "<br>");
    });
  });

  //        복사
  document.getElementById('btn').addEventListener("click", function () {
    window.getSelection().removeAllRanges();
    var range = document.createRange();
    range.selectNode(document.getElementById('append'));
    window.getSelection().addRange(range);
    document.execCommand('Copy');
  });
</script>
</body>
</html>