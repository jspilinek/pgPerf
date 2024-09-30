\o 'html/output/cacheHitRatio.html'
\qecho <!DOCTYPE html>
\qecho <html>
\qecho    <head>
\qecho        <title>Cache Hit Ratio</title>
\qecho        <link rel="stylesheet" type="text/css" href="../static/pgPerf.css"/>
\qecho        <script src="../static/sorttable.js"></script>
\qecho    </head>
\qecho    <body>
\qecho        
\qecho        <h1>Cache Hit Ratio</h1>
\qecho        <hr>
\qecho        <br>
\qecho        <a href="../pgPerf.html">Back to main page</a>
\qecho        <br>
\qecho        <!-- [<a href="prevPage.html">Prev</a>] [<a href="nextPage.html">Next</a>] -->
\qecho        <br>
\qecho        <br>
\qecho        <h2>Tables Cache Hit Ratio</h2>
\i sql/sub/:scriptName.1.sql
\qecho        <h2>Index Cache Hit Ratio</h2>
\i sql/sub/:scriptName.2.sql
\qecho        <h2>TOAST Table Cache Hit Ratio</h2>
\i sql/sub/:scriptName.3.sql
\qecho        <h2>TOAST Table Indexes Cache Hit Ratio</h2>
\i sql/sub/:scriptName.4.sql
\qecho         <br>
\qecho         <!-- <h2>Comments</h2> -->
\qecho         <!-- <p>Insert comments here</p> -->
\qecho         <br>
\qecho         <a href="../pgPerf.html">Back to main page</a>
\qecho         <br>
\qecho         <!-- [<a href="prevPage.html">Prev</a>] [<a href="nextPage.html">Next</a>] -->
\qecho         <br>
\qecho         <!-- <br>
\qecho         <footer></footer> -->
\qecho     </body>
\qecho </html>