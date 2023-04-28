<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8"/>
  <title>Главная страница</title>
  <link rel="stylesheet" href="styles.css">
</head>

<body  >
<div class="container">
  <div class="info">
    <img src="C:\Users\lads\OneDrive\Imágenes\Saved Pictures\котик.jpg"
         class="avatar" >
    <div class="info-text">
      <h1 >Ставров Владислав</h1>
      <p>Я основатель одноименного Youtube канала</p>
      <p> Я люблю путешествовать, заниматься спорстом и программировать</p>
      <h4>Мои социальные сети</h4>
      <a href="https://web.telegram.org/z/#843886181" target="_blank">
        Ссылка Инстаграм</a>
      |
      <a href="https://web.telegram.org/z/#843886181" target="_blank">
        Ссылка телеграмм</a>
    </div>
  </div>





  <div class="card bg-yellow">
    <h2>Мои хобби</h2>
    <ol class="list">
      <li>Блогер</li>
      <li>Быстрая езда на машине</li>
    </ol>
  </div>

  <div class="card bg-green">
    <h2>Опыт работы</h2>
    <table class="table">

      <tbody>
      <tr>
        <td>Epam</td>
        <td>Software Engineer</td>
        <td>2016-2017</td>
      </tr>
      <tr>
        <td>Other Company</td>
        <td>Lead frontend</td>
        <td>2017-2019</td>
      </tr>
      <tr>
        <td>Epam</td>
        <td>Software Engineer</td>
        <td>2016-2017</td>
      </tr>
      <tr>
        <td>Other Company</td>
        <td>Lead frontend</td>
        <td>2017-2019</td>
      </tr>
      </tbody>



    </table>
  </div>
  <div class="card bg-red">
    <h2>Курсы YouTube</h2>
    <ul class="link-list">
      <li>
        <a href="https://www.youtube.com/watch?v=DOEtVdkKwcU">1.Видео</a>
      </li>
      <li>
        <a href="https://www.youtube.com/watch?v=DOEtVdkKwcU">2.Видео</a>
      </li>
    </ul>

  </div>
  <div class="contact">
    <h2>Связаться со мной</h2>
    <form action="/">
      <div class="row">
        <div class="form-froup">
          <label for="name">Ваше имя</label>
          <input type="text" id="name" placeholder="Начните вводить имя">
        </div>
        <div class="form-froup">
          <label for="email">Ваша почта</label>
          <input type="text" id="email" placeholder="Начните вводить почту">
        </div>
      </div>
      <div class="form-froup">
        <label for="text">Ваше сообщение:</label>

        <textarea id="text" rows="2" cols="15"></textarea>


      </div>
      <input type="submit" value="Связаться" class="btn">
    </form>
    <div class="position">
      <div class="box">

      </div>
    </div>
  </div>
  <!--        <div class="box-model">-->
  <!--            <div></div>-->
  <!--            <div></div>-->
  <!--            <div></div>-->
  <!--        </div>-->
  <!--        <div style="margin-bottom: 500px"></div>-->
</div>
</body>

</html>