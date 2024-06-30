// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('analyzer-form');
    const loadingDiv = document.getElementById('loading');
    const modal = document.getElementById('result-modal');
    const modalContent = document.getElementById('modal-result-content');
    const permanentResult = document.getElementById('permanent-result');
    const permanentResultContent = document.getElementById('permanent-result-content');
  
    function showModal(content) {
      modalContent.textContent = content;
      modal.classList.remove('hidden');
      
      // 5秒後にモーダルを閉じる
      setTimeout(() => {
        closeModal();
        showPermanentResult(content);
      }, 3000);
    }
  
    function closeModal() {
      modal.classList.add('hidden');
    }
  
    function showPermanentResult(content) {
      permanentResultContent.textContent = content;
      permanentResult.classList.remove('hidden');
    }
  
    form.addEventListener('submit', function(e) {
      e.preventDefault();
      const url = document.getElementById('url-input').value;
      
      loadingDiv.classList.remove('hidden');
      permanentResult.classList.add('hidden');
      
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
  
    // モーダルの外側をクリックしたときにモーダルを閉じる
    modal.addEventListener('click', function(e) {
      if (e.target === modal) {
        closeModal();
        showPermanentResult(modalContent.textContent);
      }
    });
  });