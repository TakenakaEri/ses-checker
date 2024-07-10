// app/javascript/controllers/analyzer_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "result", "loading", "modal", "button"]

  connect() {
    console.log("Analyzer controller connected")
  }

  analyze(event) {
    event.preventDefault()
    console.log("Analyze button clicked")
    this.loadingTarget.classList.remove("hidden")
    this.resultTarget.classList.add("hidden")

    // ここにフォームデータの取得と送信のロジックを追加
    const formData = new FormData(this.formTarget)
    const url = this.formTarget.action

    fetch(url, {
      method: 'POST',
      body: formData,
      headers: {
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
      }
    })
    .then(response => response.json())
    .then(data => {
      this.showResult(data.result)
    })
    .catch(error => {
      console.error('Error:', error)
      this.showResult("エラーが発生しました。もう一度お試しください。")
    })
    .finally(() => {
      this.loadingTarget.classList.add("hidden")
    })
  }

  showResult(result) {
    this.resultTarget.classList.remove("hidden")
    this.resultTarget.querySelector("#permanent-result-content").textContent = result
  }
}