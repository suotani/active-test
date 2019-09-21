<template>
  <div id="app">
    <div class="wrapper">
      <h1>Room Price AI in Nara</h1>
      <div class="content-wrapper">
        <div class="main-content">
          <div class="form-wrap">
              <form>
                  <div>
                      <label>広さ</label>
                      <input type=number v-model="room.area"></input>平米
                  </div>
                  <div>
                      <label>最寄り駅</label>
                      <select v-model="room.station_id">
                          <option disabled value="">選択して下さい</option>
                          <option v-for="station in stations" v-bind:value="station" v-bind:key="station">
                              {{ station }}駅
                          </option>
                      </select>
                  </div>
                  <div>
                      <label>間取り</label>
                      <select v-model="room.plan_id">
                          <option disabled value="">選択して下さい</option>
                          <option v-for="plan in plans" v-bind:value="plan" v-bind:key="plan">
                              {{ plan }}
                          </option>
                      </select>
                  </div>
                  <div>
                      <label>築年数</label>
                      <input type=number v-model="room.age"></input>年
                  </div>
                  <div>
                      <label>最寄り駅からの時間</label>
                      <input type=number v-model="room.min_time_to_house"></input>分
                  </div>
                  <div class="button-wrap">
                    <button type="button" v-on:click="onSubmit">実行</button>
                  </div>
              </form>
          </div>
          
          <h2>
            予測賃料
            <span v-show="loading" class="loading">Now Loading...</span>
            <span v-show="!loading" class=""> {{price}}</span>
          </h2>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
export default {
    data(){
      return{
        loading: false,
        price: "",
        stations: [],
        plans: [],
        room: {area: "", age: "", min_time_to_house: "", station_id: "", plan_id: ""}
      }
    },
    created: function(){
      axios.get('/ai/home_price/new')
      .then(res => {
        this.stations = res.data.stations
        this.plans = res.data.plans
      });
    },
    methods: {
        onSubmit: function(){
          this.loading = true
            axios.post("/ai/home_price", {
                room: this.room
            })
            .then(res =>{
                this.price = res.data.price
                this.loading = false
            })
            .catch(er=>{
                this.loading = false
            })
        }
    }
}
</script>
<style>
  body{
    margin: 0;
    height: 100%;
  }
  html{
    height: 100%;
  }
</style>

<style scoped>
#app {
  background-color: #2f2f2f;
  color: #00ffe7;
  padding: 20px;
  height: 100%;
}
.wrapper{
  width: 70%;
  margin: auto;
}
h1{
  margin: 0;
  width: 80%;
  margin: auto;
}
form{
  max-width: 700px;
  margin: auto;
  border: solid 1px #00ffe7;
  padding: 40px;
}
form div{
  display: flex;
  flex-wrap: wrap;
}

label{
  width: 50%;
  margin-top: 10px;
}

select, input{
  width: 80%;
  padding: 5px;
  margin-right: 5px;
  background-color: #2f2f2f;
  border-bottom: solid 2px #00ffe7;
  color: #fff;
  font-size: 16px;
  height: 20px;
}
select{
  padding: 0;
  height: 36px;
}

.content-wrapper{
  width: 80%;
  margin: auto;
}
.button-wrap{
  display: flex;
  width: 80%;
  justify-content: flex-end;
  margin-top: 10px;
}
button{
    width: 107px;
    height: 36px;
    font-size: 15px;
    background-color: #2f2f2f;
    border: solid 1px #41d1e8;
    color: white;
    border-radius: 5px;
    cursor: pointer;
}
button:hover{
  background-color: #2f505d;
}
.loading{
  padding-left: 10px;
  font-size: 12px;
}
@media (max-width: 767px){
  .wrapper{
    width: 100%;
  }
  .content-wrapper{
    width: 100%;
  }
  .button-wrap{
    display: flex;
    width: 100%;
  }
  select, input{
    width: 77%;
  }
  form{
    padding: 8px;
  }
  button{
      width: 95%;
      margin-top: 20px;
  }
}
</style>
