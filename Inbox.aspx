<%@ Page Title="" Language="C#" MasterPageFile="~/StudentMaster.Master" AutoEventWireup="true" CodeBehind="Inbox.aspx.cs" Inherits="Lab3.Inbox" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style> 
.background { 
background-repeat: repeat;
background-attachment:scroll;
background-position: center center;
background-size: cover;
background-image:url("images/fadedbackground.png");
}
.header{ 
  text-align:center;
  font-size: 35px;
  font-family: 'Courier Prime', monospace;
  margin-bottom: 10px;

}

ul {list-style-type: none;}
body {font-family: Verdana, sans-serif;}

/* Month header */
.month {
  padding: 40px 5px;
  width: 100%;
  background: #402c6f;
  text-align: center;
}

/* Month list */
.month ul {
  margin: 0;
  padding: 0;
}

.month ul li {
  color: white;
  font-size: 20px;
  text-transform: uppercase;
  letter-spacing: 3px;
}

/* Previous button inside month header */
.month .prev {
  float: left;
  padding-top: 10px;
}

/* Next button */
.month .next {
  float: right;
  padding-top: 10px;
}

/* Weekdays (Mon-Sun) */
.weekdays {
  margin: 0;
  padding: 10px 0;
  background-color:#ddd;
}

.weekdays li {
  display: inline-block;
  width: 12.6%;
  color: #666;
  text-align: center;
}

/* Days (1-31) */
.days {
  padding: 10px 0;
  background: #eee;
  margin: 0;
}

.days li {
  list-style-type: none;
  display: inline-block;
  width: 12.6%;
  text-align: center;
  margin-bottom: 5px;
  font-size:12px;
  color: #777;
}

/* Highlight the "current" day */
.days li .active {
  padding: 5px;
  background: #402c6f;
  color: white !important
}

.calendarrow{ 
margin-top: 100px;

}

</style>
<body class="background">

  <!--logo-->
  <div class="col">
    <img src="images/logo.png" class="rounded float-left" alt="Responsive image" >
  </div>
<div class="header"> Inbox </div>
 <!--header-->


<!--email form -->

<div class="container">
    <!-- Content here -->

    <div class="container">
        <div class="row">
          <div class="col">
            <label for="exampleDataList" class="form-label"><b>Messages</b></label>
            <input class="form-control" list="datalistOptions" id="exampleDataList" placeholder="Type to search...">
            <datalist id="datalistOptions">
            <option value="Russel">
            <option value="Devenna">
            <option value="Stith">
            <option value="Crouch">
            <option value="Steele">
            </datalist>
            <table class="table">
                <thead>
                  <tr>
                    <th scope="col"></th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">4/4</th>
                    <td>@emailexample</td>
                    <td>Regarding your intrest in Capital One....</td>
                  </tr>
                </tbody>
                <tbody>
                    <tr>
                      <th scope="row">4/3</th>
                      <td>@emailexample</td>
                      <td>Regarding your intrest in Capital One....</td>
                    </tr>
                  </tbody>
                  <tbody>
                    <tr>
                      <th scope="row">3/31</th>
                      <td>@emailexample</td>
                      <td>Regarding your intrest in Capital One....</td>
                    </tr>
                  </tbody>
              </table>
          </div>
        <!--email form-->
          <div class="col">
            <div class="mb-3">
                <label for="exampleFormControlInput1" class="form-label"> <b> Email address</b></label>
                <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
              </div>
              <div class="mb-3">
                <label for="exampleFormControlTextarea1" class="form-label"> <b> Message</b></label>
                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                <button type="button" class="btn btn-secondary">Send</button>
              </div>
          </div>
        </div>
<!-- calendar row -->
<div class="calendarrow"> 
        <div class="row">
          <div class="col">
            <div class="month">
                <ul>
                  <li class="prev">&#10094;</li>
                  <li class="next">&#10095;</li>
                  <li>April<br><span style="font-size:18px">2022</span></li>
                </ul>
              </div>
              
              <ul class="weekdays">
                <li>Mo</li>
                <li>Tu</li>
                <li>We</li>
                <li>Th</li>
                <li>Fr</li>
                <li>Sa</li>
                <li>Su</li>
              </ul>
              
              <ul class="days">
                <!--need the blank links to have the calendar start on the right day-->
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li>1</li>
                <li>2</li>
                <li>3</li>
                <li>4</li>
                <li>5</li>
                <li>6</li>
                <li><span class="active">7</span></li>
                <li>8</li>
                <li>9</li>
                <li>10</li>
                <li>11</li>
                <li>12</li>
                <li>13</li>
                <li>14</li>
                <li>15</li>
                <li>16</li>
                <li>17</li>
                <li>18</li>
                <li>19</li>
                <li>20</li>
                <li>21</li>
                <li>22</li>
                <li>23</li>
                <li>24</li>
                <li>25</li>
                <li>26</li>
                <li>27</li>
                <li>28</li>
                <li>29</li>
                <li>30</li>
                
              </ul> </div>
        <!-- to-do list-->
            <div class="col">
                <table class="table">
                    <thead>
                      <tr>
                        <th scope="col"></th>
                        <th scope="col">Upcoming Events</th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <th scope="row">4/3</th>
                        <td>Capital One application </td>
                        
                      </tr>
                      <tr>
                        <th scope="row">4/20</th>
                        <td colspan="2">J.P. Morgan application</td>
                        
                      </tr>
                      <tr>
                        <th scope="row">5/1</th>
                        <td colspan="2">PNC application </td>
                      </tr>
                    </tbody>
                  </table>
                  </div>
          </div>
         
          <div class="col">
            
              </div>
        </div>
    </div>
     
      
    
    <br> 
    <br>
    
   <!--dont touch closing container tag --> 
</div>
    </div>

 
































    


<!--dont touch-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
 <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>   

</body>
</asp:Content>
