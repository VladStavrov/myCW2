
let roomsFilter='-4';
function foooo(){
    console.log("qwerty + "+roomsFilter);
}
function typeMenu(dropdown,event){
    var dropdownId=dropdown.dataset.id;
    if(dropdownId==='rooms'){
        const selectedOptionId = event.target.dataset.id;
        roomsFilter=selectedOptionId;
    }
    else {
        var a=4;
    }
}
const catalogItems = document.querySelectorAll('.block_item_catalog');
let filteredItems=catalogItems;

const dropdowns=document.querySelectorAll('.dropdown')
dropdowns.forEach(dropdown=>{
    const select1=dropdown.querySelector('.select');
    const caret=dropdown.querySelector('.caret');
    const menu=dropdown.querySelector('.menu');
    const options=dropdown.querySelectorAll('.menu li');
    const selected=dropdown.querySelector('.selected');

    select1.addEventListener('click',()=>{
        select1.classList.toggle('select-clicked');
        caret.classList.toggle('caret-rotate');
        menu.classList.toggle('menu-open');

    });
    options.forEach((option,index)=>{
        option.addEventListener('click',event =>{
            const dropdownId=dropdown.dataset.id;
            if(dropdownId==='rooms'){
                roomsFilter = event.target.dataset.id;
                selected.innerText=option.innerText;
            }
            else {
                return;
            }





            console.log(index+" = "+roomsFilter+  " = "+ catalogItems.length);
            filteredAll();

            Array.from(catalogItems).forEach((item) => item.style.display = 'none');
            filteredItems.forEach((item) => item.style.display = 'block');

            select1.classList.remove('select-clicked')
            caret.classList.remove('caret-rotate');
            menu.classList.remove('menu-open');
            options.forEach(option=>{
                option.classList.remove('active')

            })
            option.classList.add('active')
            if(option.innerText)
                console.log(`Selected value: `+ option.innerText);
        });
    })

})

function filteredAll(){

    filteredItems = Array.from(catalogItems).filter((item) => {
        const rooms = item.querySelector('.catalog_info_product.rooms .catalog_info_text').textContent;

        if(roomsFilter!='0') {

            return rooms === roomsFilter;
        }
        else {

            return rooms;
        }
    });

}