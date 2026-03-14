<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, model.Employe" %>
<!DOCTYPE html>
<html>
<head>
    <title>Liste des Employés</title>
</head>
<body>

<h2>Liste des Employés</h2>

<a href="EmployeServlet?action=new">Ajouter un employé</a>

<br><br>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Nom</th>
        <th>Prénom</th>
        <th>Poste</th>
        <th>Salaire</th>
        <th>Actions</th>
    </tr>

    <%
        List<Employe> employes = (List<Employe>) request.getAttribute("employes");
        for (Employe emp : employes) {
    %>
    <tr>
        <td><%= emp.getId() %></td>
        <td><%= emp.getNom() %></td>
        <td><%= emp.getPrenom() %></td>
        <td><%= emp.getPoste() %></td>
        <td><%= emp.getSalaire() %></td>
        <td>
            <a href="EmployeServlet?action=edit&id=<%= emp.getId() %>">Modifier</a>
            &nbsp;|&nbsp;
            <a href="EmployeServlet?action=delete&id=<%= emp.getId() %>"
               onclick="return confirm('Supprimer cet employé ?')">Supprimer</a>
        </td>
    </tr>
    <% } %>

</table>

</body>
</html>