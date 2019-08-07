<template>
  <div>
    <p><router-link :to="{name: 'top'}">一覧に戻る</router-link></p>
    <h2>{{test_name}}に問題を追加</h2>
    <div class="form-wrap">
        <p class="status">{{status}}</p>
        <form>
            <div>
                <p>問題</p>
                <textarea v-model="question.text"></textarea>
            <div>
                
            </div> 
                <label>回答</label>
                <textarea v-model="question.answer"></textarea>
            </div>
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
        question: {text: "", answer: "", test_id: ""},
        status: "",
        id: "",
        test_name: ""
      }
    },
    created: function(){
        this.id = this.$route.params.id
        this.question.test_id = this.$route.params.id
        this.test_name = this.$route.params.name
    },
    methods: {
        onSubmit: function(){
            axios.post("/api/question", {
                question: this.question
            })
            .then(res =>{
                this.status = res.data.status
                this.question.text = ""
                this.question.answer = ""
            })
            .catch(er=>{
                this.status = "fail"
            })
        }
    }
  }
</script>

<style scoped>
    textarea{
        width: 100%;
        height: 70px;
    }
</style>