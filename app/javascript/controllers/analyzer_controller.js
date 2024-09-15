// import { Controller } from "@hotwired/stimulus"

// export default class extends Controller {
//   static targets = ["form", "result", "loading", "modal", "permanentResult", "modalContent"]

//   connect() {
//     console.log("Analyzer controller connected")
//   }

//   analyze(event) {
//     event.preventDefault()
//     console.log("Analyze button clicked")
//     this.loadingTarget.classList.remove("hidden")
//     this.resultTarget.classList.add("hidden")

//     const formData = new FormData(this.formTarget)
//     const url = this.formTarget.action

//     fetch(url, {
//       method: 'POST',
//       body: formData,
//       headers: {
//         'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
//       }
//     })
//     .then(response => response.json())
//     .then(data => {
//       this.showModal(`分析結果: ${data.result}`)
//     })
//     .catch(error => {
//       console.error('Error:', error)
//       this.showModal("エラーが発生しました。もう一度お試しください。")
//     })
//     .finally(() => {
//       this.loadingTarget.classList.add("hidden")
//     })
//   }

//   showModal(content) {
//     this.modalContentTarget.textContent = content
//     this.modalTarget.classList.remove("hidden")
//     setTimeout(() => {
//       this.closeModal()
//       this.showPermanentResult(content)
//     }, 2000)
//   }

//   closeModal() {
//     this.modalTarget.classList.add("hidden")
//   }

//   showPermanentResult(content) {
//     this.permanentResultTarget.textContent = content
//     this.resultTarget.classList.remove("hidden")
//   }
// }