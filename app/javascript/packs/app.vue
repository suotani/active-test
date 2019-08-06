<template>
  <div id="app">
    <div class="wrapper">
      <h1>ActiveTest</h1>
      <div class="content-wrapper">
        <div class="main-content">
          <router-view />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Hello Vue!"
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
h1{

}
.content-wrapper{
  width: 80%;
}
</style>
