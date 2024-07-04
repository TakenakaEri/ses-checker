// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
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

    //   非同期HTTPリクエスト
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
        showModal(`診断結果: ${data.result}`);
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

// フラッシュメッセージを一定時間で消す
window.setTimeout(() => {
    $(".notice").fadeOut();
}, 2000);