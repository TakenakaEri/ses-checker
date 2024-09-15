// Entry point for the build script in your package.json

import "./controllers"




document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('analyzer-form');
    const loadingDiv = document.getElementById('loading');
    const resultSection = document.getElementById('result-section');
    const permanentResultContent = document.getElementById('permanent-result-content');
    const modal = document.getElementById('result-modal');
    const modalContent = document.getElementById('modal-result-content');

    function showPermanentResult(content) {
      permanentResultContent.textContent = content;
      resultSection.classList.remove('hidden');
    }

  if (form) {
    form.addEventListener('submit', function(e) {
      e.preventDefault();
      const url = document.getElementById('url-input').value;

      resultSection.classList.add('hidden');
      loadingDiv.classList.remove('hidden');

      //  非同期HTTPリクエスト
      fetch('/analyze', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
        },
        body: JSON.stringify({ url: url })
      })
      .then(response => response.json())
      .then(data => {
        loadingDiv.classList.add('hidden');
        showModal(`分析結果: ${data.result}`);
      })
      .catch(error => {
        loadingDiv.classList.add('hidden');
        showModal(`エラーが発生しました: ${error.message}`);
      });
    });
  }
  if (modal) {
      modal.addEventListener('click', function(e) {
          if (e.target === modal) {
              closeModal();
              showPermanentResult(modalContent.textContent);
          }
      });
  }
  // モーダルを表示する
  function showModal(content) {
      modalContent.textContent = content;
      modal.classList.remove('hidden');

      // 5秒後にモーダルを閉じる
      setTimeout(() => {
          closeModal();
          showPermanentResult(content);
      }, 2000);
  }

  // モーダルを閉じる
  function closeModal() {
      modal.classList.add('hidden');
  }

  // モーダルの外側をクリックしたときにモーダルを閉じる
  modal.addEventListener('click', function(e) {
    if (e.target === modal) {
      closeModal();
      showPermanentResult(modalContent.textContent);
    }
  });
});

// クラスのflash-messageに対してフェードアウト効果を適用する
const flashMessages = document.querySelectorAll('.flash-message');

flashMessages.forEach((flashMessage) => {
  // フラッシュメッセージを5秒後に非表示にする
  setTimeout(() => {
    fadeOut(flashMessage);
  }, 2000);
});

// フェードアウト効果を適用する関数
function fadeOut(element) {
  let opacity = 1;
  const timer = setInterval(() => {
    if (opacity <= 0.1) {
      clearInterval(timer);
      element.style.display = 'none';
    }
    element.style.opacity = opacity;
    opacity -= opacity * 0.1;
  }, 50);

}

// パーティクル用の設定
if (typeof particlesJS !== 'undefined') {
  particlesJS.load('particles-js', '/particles.json', function() {
    console.log('particles.js loaded - callback');
  });
}

import "./channels"
