<template>
<div class="container_main">
  <div class="main-container">
    <div class="containerr" v-if="regis">
      <div class="window">
        <div class="overlay"></div>
        <div class="content">
          <div class="welcome">Registration!</div>
          <br />

          <b-form @submit.prevent="onRegister" @reset.prevent="onReset">
            <b-form-group
              id="input-group-email"
              label-cols-sm="4"
              label="Email"
              label-for="email"
            >
              <b-form-input
                id="email"
                type="email"
                v-model="$v.form.email.$model"
                :state="validateState('email')"
              ></b-form-input>
              <b-form-invalid-feedback v-if="!$v.form.email.required">
                Email address is required
              </b-form-invalid-feedback>
              <b-form-invalid-feedback v-if="!$v.form.email.email">
                Email is not a properly formatted email address
              </b-form-invalid-feedback>
            </b-form-group>

            <b-form-group
              id="input-group-email-confirmEmail"
              label-cols-sm="4"
              label="Confirm Email"
              label-for="confirmEmail"
            >
              <b-form-input
                id="confirmEmail"
                type="email"
                v-model="$v.form.confirmEmail.$model"
                :state="validateState('confirmEmail')"
              ></b-form-input>
              <b-form-invalid-feedback v-if="!$v.form.confirmEmail.required">
                Email address is required
              </b-form-invalid-feedback>
              <b-form-invalid-feedback v-else-if="!$v.form.confirmEmail.email">
                Email is not a properly formatted email address
              </b-form-invalid-feedback>
              <b-form-invalid-feedback v-else-if="!$v.form.confirmEmail.sameAsEmail">
                Email addresses must match
              </b-form-invalid-feedback>
            </b-form-group>

            <b-form-group
              id="input-group-firstName"
              label-cols-sm="4"
              label="First Name"
              label-for="firstName"
            >
              <b-form-input
                id="firstName"
                v-model="$v.form.firstName.$model"
                type="text"
                :state="validateState('firstName')"
              ></b-form-input>
              <b-form-invalid-feedback v-if="!$v.form.firstName.required">
                First name is required
              </b-form-invalid-feedback>
            </b-form-group>

            <b-form-group
              id="input-group-lastName"
              label-cols-sm="4"
              label="Last Name"
              label-for="lastName"
            >
              <b-form-input
                id="lastName"
                v-model="$v.form.lastName.$model"
                type="text"
                :state="validateState('lastName')"
              ></b-form-input>

            </b-form-group>

            <b-form-group
              id="input-group-gender"
              label-cols-sm="4"
              label="Gender"
              label-for="gender"
            >
              <b-form-select
                id="gender"
                v-model="$v.form.gender.$model"
                :options="genders"
                :state="validateState('gender')"
              ></b-form-select>

            </b-form-group>

            <b-form-group
              id="input-group-age"
              label-cols-sm="4"
              label="Age"
              label-for="age"
            >
              <b-form-input
                id="age"
                v-model="$v.form.age.$model"
                type="text"
                :state="validateState('age')"
              ></b-form-input>
            </b-form-group>

            <button
              type="submit"
              variant="primary"
              style="width: 100%;"
              class="ghost-round full-width"
            >
              Create Account
            </button>
 
            <div >
               Already have an account?
              <router-link to="login" style="color: #d85416; font-size: 19px;"
                ><b>Log in here</b></router-link
              >
              <br />

            </div>
          </b-form>
          <b-alert
            class="mt-2"
            v-if="form.submitError"
            variant="warning"
            dismissible
            show
          >
            Register failed: {{ form.submitError }}
          </b-alert>
        </div>
      </div>
    </div>
      <transition name="fade">
        <div class="popup-modal" v-if="isVisible">
            <div class="window1" style="overflow-y:scroll; height:550px; max-width: 950px;">
                <slot>   
                      
                <p class="textregi" style=" text-align: center;">
                      <img src='../assets/new logo.png'  style="width: 30%; height:30%;" />
                       <br>
                  <br><b>
                  ברוכים הבאים למשחק העדפת תמונות
                  <br/>
                  .המשחק נערך במסגרת פרויקט גמר במחלקה להנדסת מערכות תוכנה ומידע
                  </b>
                  <br/><br/>
                  <u>:המשחק מחולק לשני שלבים</u>
                </p>
                <p class="textregi" style=" text-align: right;">
                  <br/>
                  .בשלב הראשון, עליכם לצפות ב-72 תמונות ולתת לכל תמונה ציון שמבטא עד כמה אתם אוהבים אותה 
                  <br/>
                  חשוב שתתנו ציונים המשקפים את העדפותיכם כי בהמשך המשחק יהיה עליכם לזהות אילו תמונות 
                  <br/>
                  .אהבתם יותר ואילו פחות. שלב זה נמשך בערך 10 דקות
                  <br/><br/>
                  לאחר השלמת שלב זה תוכלו לשחק במשחק. בכל פעם שתיכנסו למערכת יוצגו בפניכם מסכים עם
                  <br/>
                  תמונות שראיתם בשלב הראשון. האתגר במשחק הוא לבחור את התמונות להן נתתם את הציונים  
                  <br/>
                  .הגבוהים ביותר בשלב הקודם. על כל בחירה נכונה תקבלו נקודה אחת
                  
                  <br/><br/>

                  כדי לאפשר משחק בהתאם לכללים, וכדי לאפשר קשר אתכם במהלך תקופת
                   המשחק, נבקשכם לציין כתובת 
                   <br>
                של דואר אלקטרוני באמצעותה נוכל לשלוח לכם הודעות (למשל, תזכורת במידה ועברו מספר ימים מאז ששיחקתם לאחרונה).
               מעבר לכך, אין צורך באמצעי הזדהות כלשהו. במהלך ההרשמה תוכלו לבחור בעצמכם
               <br/>
                .שם או כינוי שיאפשר לכם לזהות את עצמכם בטבלת השחקנים המצטיינים
                  <br/><br/>
                  <u>:אנו מתחייבים</u>
                  <br/>
                  <ul style="direction: RTL; text-align: right;">
                    <li>לעדכן אתכם לגבי ההישג שלכם במשחק עם סיום תקופת המשחק.
                    </li>
                    <li>כל הנתונים על המשחק יישמרו על מחשב מאובטח וישמשו אך ורק לניתוחים סטטיסטיים.
                    </li>
                    <li>בשום אופן לא יפורסמו נתונים אישיים לגביכם.</li>
                  </ul>
                  <br/>

                 </p>
                 <p class="textregi" style=" text-align: center;">
                  .בלחיצה על כפתור "אישור" אני מסכים/ה להשתתף במשחק העדפת התמונות בהתאם לתנאים שפורטו לעיל
                </p>
            <br/>   
            <br/>
            <b-row>
              <b-col></b-col>

              <b-col lg="6" class="pb-2">
                <b-button block @click="close()">אישור</b-button>
              </b-col>

              <b-col></b-col>
            </b-row>
               
            </slot>
                </div>
            </div>
        </transition>
        <br />
      </div>
    </div>
</template>

<script>
import {
  required,
  email,
  sameAs,
} from "vuelidate/lib/validators";

export default {
  name: "register",
  data() {
    return {
      isVisible: true,
      regis: false,
      form: {
        firstName: "",
        lastName: "",
        gender: null,
        age: "",
        email: "",
        confirmEmail: "",
        submitError: undefined,
      },
      genders: [
        { value: null, text: "", disabled: true },
        { value: "female", text: "female", disabled: false },
        { value: "male", text: "male", disabled: false },
      ],
      errors: [],
      validated: false,
    };
  },
  validations: {
    form: {
      email: {
        required,
        email,
      },
      firstName: {
        required,
      },
      lastName: {
        
      },
      confirmEmail: {
        required,
        email,
        sameAsEmail: sameAs("email"),
      },
      gender: {
      },
      age: {
      },
    },
  },
  methods: {
    open() {
            this.isVisible = true
        },

        close() {
            this.isVisible = false
            this.regis=true
        },
    validateState(param) {
      const { $dirty, $error } = this.$v.form[param];
      return $dirty ? !$error : null;
    },
    
    async Register() {
      try {
        const response = await this.axios.post(
          this.$root.store.base_url + "/Registration",
          {
            email: this.form.email,
            firstname: this.form.firstName,
            lastname: this.form.lastName,
            gender: this.form.gender,
            age: this.form.age,
          }
        );
        console.log(response);
        this.$router.push("/Login");
      } catch (err) {
        console.log(err.response);
        this.form.submitError = err.response.data;
      }
    },
    onRegister() {
      this.$v.form.$touch();
      if (this.$v.form.$anyError) {
        return;
      }
      this.Register();
    },
    onReset() {
      this.form = {
        email: "",
        firstName: "",
        lastName: "",
        gender: null,
        age: "",
        confirmEmail: "",
      };
      this.$nextTick(() => {
        this.$v.$reset();
      });
    },
  },
};
</script>
<style lang="scss">
.fade-enter-active,
.fade-leave-active {
    transition: opacity 0.3s;
}
.fade-enter,
.fade-leave-to {
    opacity: 0;
}
.main-container {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-top: 10px;
}

.containerr {
  width: 50%;
}

 @import url(https://fonts.googleapis.com/css?family=Raleway);
body,
html {
  margin: 0;
  height: 100%;
}

input {
  border: none;
}

button:focus {
  outline: none;
}

::-webkit-input-placeholder {
  color: rgba(255, 255, 255, 0.65);
}

::-webkit-input-placeholder .input-line:focus + ::input-placeholder {
  color: #fff;
}

.highlight {
  color: rgba(255, 255, 255, 0.8);
  font-weight: 400;
  cursor: pointer;
  transition: color 0.2s ease;
}

.highlight:hover {
  color: #fff;
  transition: color 0.2s ease;
}

.spacing {
  -webkit-box-flex: 1;
  -webkit-flex-grow: 1;
  -ms-flex-positive: 1;
  flex-grow: 1;
  height: 120px;
  font-weight: 300;
  text-align: center;
  margin-top: 10px;
  color: rgba(255, 255, 255, 0.65);
}

.input-line:focus {
  outline: none;
  border-color: #fff;
  -webkit-transition: all 0.2s ease;
  transition: all 0.2s ease;
}

.ghost-round {
  cursor: pointer;
  background: none;
  border: 1px solid rgba(255, 255, 255, 0.65);
  border-radius: 25px;
  color: rgba(10, 10, 10, 0.65);
  -webkit-align-self: flex-end;
  -ms-flex-item-align: end;
  align-self: flex-end;
  font-size: 19px;
  font-size: 1.2rem;
  font-family: Raleway !important;
  font-weight: 300;
  line-height: 2.5em;
  margin-top: auto;
  margin-bottom: 25px;
  -webkit-transition: all 0.2s ease;
  transition: all 0.2s ease;
}

.ghost-round:hover {
  background: rgba(255, 255, 255, 0.15);
  color: #fff;
  -webkit-transition: all 0.2s ease;
  transition: all 0.2s ease;
}

.input-line {
  background: none;
  margin-bottom: 10px;
  line-height: 2.4em;
  color: #fff;
  font-family: Raleway !important;
  font-weight: 300;
  letter-spacing: 0px;
  letter-spacing: 0.02rem;
  font-size: 19px;
  font-size: 1.2rem;
  border-bottom: 1px solid rgba(255, 255, 255, 0.65);
  -webkit-transition: all 0.2s ease;
  transition: all 0.2s ease;
}

.full-width {
  width: 100%;
}

.input-fields {
  margin-top: 25px;
}

.content {
  padding-left: 25px;
  padding-right: 25px;
  width: 80%;
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-flex-flow: column;
  -ms-flex-flow: column;
  flex-flow: column;
  z-index: 5;
  margin-top: 0px;
}

.welcome {
  text-align: center;
  font-size: 40px;
  font-size: 2.5rem;
  letter-spacing: 0px;
  letter-spacing: 0.05rem;
  color: black;
  font-family: Raleway !important;
}

.subtitle {
  font-size: 20px;
  text-align: center;
  line-height: 1em;
  font-weight: 100;
  letter-spacing: 0px;
  letter-spacing: 0.02rem;
  color: rgb(34, 34, 34);
}

.menu {
  background: rgba(0, 0, 0, 0.2);
  width: 100%;
  height: 50%;
}

.window {
  z-index: 100;
  color: rgb(51, 51, 51);
  font-family: Raleway !important;
  position: relative;
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-flex-flow: column;
  -ms-flex-flow: column;
  flex-flow: column;
  box-shadow: 0px 15px 50px 10px rgba(0, 0, 0, 0.2);
  box-sizing: border-box;
  background: #fff;
  text-align: left;
}

.overlay {
  background: -webkit-linear-gradient(#ccd2df, #6b656e);
  background: linear-gradient(#e9c9b5c5, #f3c48ec7);
  opacity: 0.95;
  filter: alpha(opacity=85);
  height: 100%;
  position: absolute;
  width: 100%;
  z-index: 1;
  border-radius: 15px;
}

.bold-line {
  background: #e7e7e7;
  position: absolute;
  top: 0px;
  bottom: 0px;
  margin: auto;
  height: 100%;
  z-index: 1;
  opacity: 0.1;
  background-size: cover;
}
.container_main {
  width: 100%;
  height: 100%;
}

  .window {
    width: 100%;
    height: 100%;
  }
  .overlay {
    width: 100%;
    height: 100%;
  }
  .window1 {
    box-shadow: 2px 4px 8px rgba(0, 0, 0, 0.2);
    max-width: 80%;
    margin-left: auto;
    margin-right: auto;
    flex-direction: column;
    justify-content: center;
    align-items:center;
    text-align: right;
    color: black;
      margin: auto;

  border: 3px solid rgba(143, 241, 216, 0.87);
 border-radius: 2px;
  padding: 1.1rem;
  background-color: rgba(251, 241, 226, 0.897);
}
  .popup-modal {
    background-color: rgba(0, 0, 0, 0.5);
    position: fixed;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    margin-bottom: 0px;
    display: flex;
    align-items: center;
    z-index: 1;

}
.textregi{
    font-size: large;
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    text-align: right;
    color: black;
}

.form-check-label-regi {
  margin-right: 30px;
  font-size: 17px;
  font-family: Verdana, Geneva, Tahoma, sans-serif;
}

.pb-2 {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
}
</style>
