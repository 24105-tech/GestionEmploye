<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Formulaire Employé</title>
</head>
<body>

<h2>
    <% if (request.getAttribute("employe") != null) { %>
    Modifier l'employé
    <% } else { %>
    Ajouter un employé
    <% } %>
</h2>

<form action="EmployeServlet" method="post">

    <% if (request.getAttribute("employe") != null) {
        model.Employe emp = (model.Employe) request.getAttribute("employe");
    %>
    <input type="hidden" name="id" value="<%= emp.getId() %>"/>
    <input type="hidden" name="action" value="update"/>

    Nom : <input type="text" name="nom" value="<%= emp.getNom() %>"/><br><br>
    Prenom : <input type="text" name="prenom" value="<%= emp.getPrenom() %>"/><br><br>
    Poste : <input type="text" name="poste" value="<%= emp.getPoste() %>"/><br><br>
    Salaire : <input type="text" name="salaire" value="<%= emp.getSalaire() %>"/><br><br>
    <input type="submit" value="Modifier"/>

    <% } else { %>
    <input type="hidden" name="action" value="insert"/>

    Nom : <input type="text" name="nom"/><br><br>
    Prenom : <input type="text" name="prenom"/><br><br>
    Poste : <input type="text" name="poste"/><br><br>
    Salaire : <input type="text" name="salaire"/><br><br>
    <input type="submit" value="Ajouter Employé"/>

    <% } %>

</form>

<br>
<a href="EmployeServlet?action=list">Retour à la liste</a>

</body>
</html>