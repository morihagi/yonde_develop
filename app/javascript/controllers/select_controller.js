import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="select"
export default class extends Controller {
  connect() {
    this.defaultSegmentSelect = `<select name="segment" id="segment">
    <option value>---</option>
    </select>`;

    // カテゴリーが変更された時の処理
    this.programTarget.addEventListener('change', () => {
      // カテゴリーが選ばれた場合
      if (this.programTarget.value !== '') {
        // 空のサブカテゴリーのセレクトボックスを削除
        this.segmentTarget.remove();

        // 選択されたカテゴリーに応じたHTMLを挿入
        let selectedTemplate = document.querySelector(`#sub-program-of-program${this.programTarget.value}`);
        this.programTarget.insertAdjacentHTML('afterend', selectedTemplate.innerHTML);
      } else {
        // サブカテゴリー選択用のセレクトボックスを削除
        this.segmentTarget.remove();

        // ダミーのセレクトボックスを挿入
        this.programTarget.insertAdjacentHTML('afterend', this.defaultSegmentSelect);
      }
    });
  }
}
