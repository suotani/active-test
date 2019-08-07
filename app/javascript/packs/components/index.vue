<template>
  <div>
    <p><router-link :to="{name: 'new'}">新しく作る</router-link></p>
    <ul>
      <li v-for="test in list">
        <p class="title"><router-link :to="{name: 'show', params: {id: test.id, name: test.name}}">
          {{test.name}}({{test.count}})
        </router-link></p>
        <p class="add-link"><router-link :to="{name: 'add', params: {id: test.id, name: test.name}}">add</router-link></p>
      </li>
    </ul>
  </div>
</template>

<script>
import axios from 'axios'
  export default{
    data(){
      return{
        list: []
      }
    },
    created: function(){
      axios.get('/api/active_test')
      .then(res => {
        this.list = res.data.tests
      });
    }
  }
</script>

<style scoped>
ul{
  list-style: none;
}
li{
  display: flex;
}
li .title{
  width: 80%;
}
li .add-link{
  width: 20%;
  text-align: center;
  box-sizing: border-box;
  border: solid 3px #000;
  border-radius: 4px;
}
a {
  text-decoration: none;
}

li .add-link a{
  text-decoration: none;
  display: inline-block;
  width: 100%;
}
</style>