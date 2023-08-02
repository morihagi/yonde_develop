import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["categorySelect", "subCategorySelect"];

  categories = ["Adoのオールナイトニッポン", "緑黄色社会・長屋晴子のオールナイトニッポンX"];

  subCategories = [
    { program: 'Adoのオールナイトニッポン', segment_title: 'Adoレナリン', segment_id: 1 },
    { program: '緑黄色社会・長屋晴子のオールナイトニッポンX', segment_title: '永久不滅の作り方～長屋晴子の友達の壁～', segment_id: 2 },
  ];

  connect() {
    this.populateCategories();
    this.categorySelectTarget.addEventListener('change', () => this.onChange());
  }

  populateCategories() {
    // select program
    this.categories.forEach(category => {
      const option = document.createElement('option');
      option.textContent = category;
      this.categorySelectTarget.appendChild(option);
    });
  }

  onChange() {
    // generate the program's segments
    const selectedCategory = this.categorySelectTarget.value;
    // reset pulldown
    this.subCategorySelectTarget.innerHTML = '<option value="">選択してください</option>';
    this.subCategories.forEach(subCategory => {
      if (subCategory.program === selectedCategory) {
        const option = document.createElement('option');
        option.textContent = subCategory.segment_title;
        option.value = subCategory.segment_id;
        this.subCategorySelectTarget.appendChild(option);
      }
    });

    // Set the selected subCategory's segment_id to the post's segment_id
    const selectedSegmentId = this.subCategorySelectTarget.value;
    const postSegmentIdInput = document.querySelector('#post_segment_id'); // Replace 'post_segment_id' with the actual input field ID
    postSegmentIdInput.value = selectedSegmentId;
  }
}
