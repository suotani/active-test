<template>
  <div>
    <p><router-link :to="{name: 'top'}">一覧に戻る</router-link></p>
    <div class="form-wrap">
        <p class="status">{{status}}</p>
        <form>
            <input type="text" v-model="name">
            <button type="button" v-on:click="onSubmit">登録</button>
        </form>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
  export default{
    data(){
      return{
        name: "",
        status: ""
      }
    },
    created: function(){
    },
    methods: {
        onSubmit: function(){
            axios.post("/api/active_test", {
                name: this.name
            })
            .then(res =>{
                this.status = res.data.status
                this.name = ""
            })
            .catch(er=>{
                this.status = "fail"
            })
        }
    }
  }
</script>