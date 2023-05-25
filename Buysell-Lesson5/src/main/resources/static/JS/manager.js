window.addEventListener('DOMContentLoaded', () => {
    const imageContainers=document.getElementsByClassName('imageContainer');

    /*const imageContainer = document.getElementById('imageContainer');*/
    let imageIndex = 0;
    console.log("3");

    for (let i = 0; i < imageContainers.length; i++) {
        const imageContainer = imageContainers[i];

        createImageBlock(imageContainer);


    }






});
function createImageBlock(imageContainer) {
    console.log("1");
    const div = document.createElement('div');
    div.classList.add('image-block');

    const input = document.createElement('input');
    input.type = 'file';
    input.accept = 'image/*';
    input.name='files';

    input.addEventListener('change', (event) => {

        handleImageUpload(event, imageContainer, input);
    });


    const img = document.createElement('img');
    img.style.display='none';
    img.classList.add('image-Manager');
    const deleteButton = document.createElement('button');
    deleteButton.textContent = 'Удалить';
    deleteButton.style.display='none';
    deleteButton.addEventListener('click', () => {
        div.remove();
    });

    div.appendChild(input);
    div.appendChild(img);
    div.appendChild(deleteButton);
    imageContainer.appendChild(div);
}
function handleImageUpload(event,imageContainer,input) {
    console.log("2");
    const file = event.target.files[0];

    if (!file) return;

    const reader = new FileReader();
    reader.addEventListener('load', (readerEvent) => {
        const btn = event.target.parentNode.querySelector('button');
        if(!(input.name==='files')){
            inputImageId=document.getElementsByName('inputNumberImageName');


            inputImageId.forEach(function(inputValue){
                if(inputValue.value===input.id){
                    inputValue.name="space";
                }
            });

            input.name='files';
        }

        if( btn.style.display==='none'){
            createImageBlock(imageContainer);
        }
        const img = event.target.parentNode.querySelector('img');
        img.src = readerEvent.target.result;
        img.style.display='block';

        btn.style.display='block';


    });
    reader.readAsDataURL(file);


}