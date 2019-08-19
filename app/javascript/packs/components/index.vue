<template>
  <div>
    <p>
      <router-link :to="{name: 'new'}">新しく作る</router-link>|
      <router-link :to="{name: 'test', params: {test_ids: tests}}">選択した問題でシャッフル出題</router-link>
    </p>
    <ul>
      <li v-for="test in list">
        <p class="check"><input type="checkbox" v-model="tests" v-bind:value="test.id"></p>
        <p class="title"><router-link :to="{name: 'show', params: {id: test.id, name: test.name}}">
          {{test.name}}({{test.count}})
        </router-link></p>
        <p class="add-link"><router-link :to="{name: 'add', params: {id: test.id, name: test.name}}">add</router-link></p>
        <p class="check"></p>
        <p class="last_question">{{test.last_question}}</p>
      </li>
    </ul>
  </div>
</template>

<script>
import axios from 'axios'
  export default{
    data(){
      return{
        list: [],
        tests: []
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
p{
  margin-top: 3px;
  margin-bottom: 5px;
  box-sizing: border-box;
}
ul{
  list-style: none;
  padding-left: 0;
}
li{
  display: flex;
  flex-wrap: wrap;
}
li .check{
  width: 5%;
}
li .title{
  width: 75%;
  padding-left: 10px;
}
li .last_question{
  padding-left: 10px;
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