const startgame = document.getElementById('start');
const compgame = document.getElementById('comp');
const scissor = document.getElementById('scissor');
const rock = document.getElementById('rock');
const paper = document.getElementById('paper');
const two = document.getElementById('two');
const rps1 = document.getElementById('rps-1');
const rps2 = document.getElementById('rps-2');
const ret = document.getElementById('bazghast');
const close = document.getElementById('close');
const add = document.getElementById('add');
const scr1 = document.getElementById('score-1');
const scr2 = document.getElementById('score-2');
const fina = document.getElementById('final');
const finaa = document.getElementById('finalc');
let GameMode = '';
let selectedbyplayer1 = 0;
let selectedbyplayer2 = 0;
let j =0;
let winningScore=0;
let i=2;
let ender = 0;
let counter = 0;
let timer;
ret.addEventListener('click',() => {
    startgame.classList.toggle('remove');
    refer();
    compgame.classList.toggle('remove');
    two.classList.toggle('remove');
    two.nextElementSibling.classList.toggle('remove');
    fina.classList.toggle('remove');
    finaa.classList.toggle('remove');
    clearRound();
})
startgame.addEventListener('click', () =>{
    startgame.classList.toggle('remove');
    compgame.classList.toggle('remove');
    two.classList.toggle('remove');
    two.nextElementSibling.classList.toggle('remove');
});
compgame.addEventListener('click',()=>{
    refer();
    GameMode = 'comp'
});
two.addEventListener('click',()=>{
    refer();
    GameMode = 'two';
    changename();
});
paper.addEventListener('click', () =>{
    if(GameMode == 'comp'){
        selectedbyplayer1=1;
    CompRandom(selectedbyplayer1);
    }else if(GameMode == 'two'){
        if( i%2 == 0){   
            selectedbyplayer1=1;
            select1();
            i++;
        }else{
            selectedbyplayer2=1;
            select2(selectedbyplayer2);
            i++;
        }
        clearafter(i)
    }
    clearfinal();
    checkwinner();
});

rock.addEventListener('click', () =>{
    
    if(GameMode == 'comp'){
        selectedbyplayer1=2;
    CompRandom(selectedbyplayer1);
    }else if(GameMode == 'two'){
        if( i%2 == 0){   
            selectedbyplayer1=2;
            select1();
            i++;
        }else{
            selectedbyplayer2=2;
            select2(selectedbyplayer2);
            i++;
        }
        clearafter(i)
    }
    clearfinal();
    checkwinner();
});

scissor.addEventListener('click', () =>{
    
    if(GameMode == 'comp'){
        selectedbyplayer1=3;
    CompRandom(selectedbyplayer1);
    }else if(GameMode == 'two'){
        if( i%2 == 0){   
            selectedbyplayer1=3;
            select1();
            i++;
        }else{
            selectedbyplayer2=3;
            select2(selectedbyplayer2);
            i++;
        }
    clearfinal();
        clearafter(i)
    }
    checkwinner();
});
function CompRandom(z){
    rps1.src = 'img/item-'+ z +'.jpg';
    j = Math.floor(Math.random() * 3) + 1;
    rps2.src = 'img/item-'+ j+'.jpg';
    selectedbyplayer2 = j;
    finalscore(selectedbyplayer1,selectedbyplayer2);
}
function finalscore(x,y){
    fina.classList.remove('remove');
    if(x==y){
        fina.textContent = 'مساوی';
    }
    if(x==1 && y==2){
        win();
    }
    if(x==1 && y==3){
        lose();
    }
    if(x==2 && y==1){
        lose();
    }
    if(x==2 && y==3){
        win();
    }
    if(x==3 && y==2){
        lose();
    }
    if(x==3 && y==1){
        win();
    }
}
function checkwinner(){
    let input = document.querySelector('.CustomScore').value;
{  if (input) {
    winningScore = input;
} else {
    winningScore = 10;
}
}
    if(Number(scr1.textContent) >= winningScore){
        finaa.textContent = ` تبریک! شما برنده این راند شدید `;
        finaa.style.backgroundColor= "yellowgreen";
        ender =1;
        counter++;
        clearRound();
    }
    if( Number(scr2.textContent) >= winningScore){
        finaa.textContent = ` اوپسسس! شما متاسفانه بازنده این راند شدید`;
        finaa.style.backgroundColor= "red";
        ender =1;
        counter++;
        clearRound();
    }
}
function clearRound(){
    scr1.textContent = '0';
    scr2.textContent = '0';
    if(counter>=3){
        adds();
    }
}
function win(){
    if(GameMode=='comp'){
        fina.textContent = 'برنده شدید';
    }else if( GameMode == 'two'){
        fina.textContent = 'بازیکن یک برنده شد';
    }
    scr1.textContent = Number(scr1.textContent) +1;
}
function lose(){
    if(GameMode == 'comp'){
        fina.textContent = 'شما باختید';
    }else if( GameMode == 'two'){
        fina.textContent = 'بازیکن دو برنده شد';
    }
    scr2.textContent = Number(scr2.textContent) +1;
}
function clearafter(i){
    if(i>=3){
        if(i%2 == 0){
            finalscore(selectedbyplayer1,selectedbyplayer2);
        }
    }
}
function select1(){
    rps1.src = 'img/Untitled-1.jpg';
}
function select2(d){
    rps2.src = 'img/item-'+ d+'.jpg';
    rps1.src = 'img/item-'+ selectedbyplayer1 +'.jpg';
}
function clearfinal(){
    if(ender==1){
        finaa.textContent ='';
        ender =0;
    }
}
function changename(){
    document.getElementById('name-1').textContent = 'بازیکن یک';
    document.getElementById('name-2').textContent = 'بازیکن دو';
}
function refer(){
    compgame.classList.toggle('remove');
    two.classList.toggle('remove');
    rock.classList.toggle('remove');
    paper.classList.toggle('remove');
    scissor.classList.toggle('remove');
    rps1.classList.toggle('remove');
    document.querySelector('.CustomScore').classList.toggle('remove');
        rps2.classList.toggle('remove');
        document.getElementById('player1').classList.toggle('remove');
        document.getElementById('player2').classList.toggle('remove');
        two.nextElementSibling.classList.toggle('remove');
        ret.classList.toggle('remove');
}
close.addEventListener('click',()=>{
    add.classList.toggle('remove');
})
window.addEventListener('click', ()=>{
 setTimeout(adds , 120000)
})
function adds(){
    
    add.classList.toggle('remove');
    counter = 0;
}