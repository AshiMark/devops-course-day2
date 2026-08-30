<script>
   document.getElementById('loginForm').addEventListener('submit', function(event) {
       event.preventDefault(); // Prevent page refresh
       // Hardcoded credentials for demonstration
       const validCredentials = {
           "user1": "password1",
           "user2": "password2"
       };
       const username = document.getElementById('username').value;
       const password = document.getElementById('password').value;
       // Validate credentials
       if (validCredentials[username] === password) {
           alert("Login successful!");
           window.location.href = "dashboard.html"; // Redirect to dashboard
       } else {
           alert("Invalid username or password.");
       }
   });
</script>