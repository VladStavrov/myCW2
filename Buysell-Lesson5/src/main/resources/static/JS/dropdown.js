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
    options.forEach(option=>{
        option.addEventListener('click',()=>{
            selected.innerText=option.innerText;
            select1.classList.remove('select-clicked')
            caret.classList.remove('caret-rotate');
            menu.classList.remove('menu-open');
            options.forEach(option=>{
                option.classList.remove('active')

            })
            option.classList.add('active')
        });
    })

})
function foo(){
    console.log("Илья лох")
}