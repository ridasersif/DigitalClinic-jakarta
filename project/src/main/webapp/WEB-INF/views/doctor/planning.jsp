<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Planning Docteur"/>
</jsp:include>

<div class="container-fluid">
    <div class="row">
        <jsp:include page="sidebar-doctor.jsp">
            <jsp:param name="active" value="planning"/>
        </jsp:include>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2 fw-bold text-primary">Mon Planning</h1>
                <div class="btn-toolbar mb-2 mb-md-0">
                    <div class="btn-group me-2">
                        <button type="button" class="btn btn-sm btn-outline-primary">Semaine</button>
                        <button type="button" class="btn btn-sm btn-outline-primary">Mois</button>
                        <button type="button" class="btn btn-sm btn-outline-primary">Jour</button>
                    </div>
                    <div class="btn-group">
                        <button class="btn btn-sm btn-outline-secondary">&lt;</button>
                        <button class="btn btn-sm btn-outline-secondary">13-19 Oct 2025</button>
                        <button class="btn btn-sm btn-outline-secondary">&gt;</button>
                    </div>
                </div>
            </div>

            <div class="card shadow">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead class="table-light">
                            <tr>
                                <th>Heure</th>
                                <th>Lun 13</th>
                                <th>Mar 14</th>
                                <th>Mer 15</th>
                                <th>Jeu 16</th>
                                <th>Ven 17</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td class="table-secondary fw-bold">08:00</td>
                                <td class="bg-success text-white">
                                    <strong>Dupont Jean</strong><br>
                                    <small>Salle 201</small>
                                </td>
                                <td></td>
                                <td class="bg-warning">
                                    <strong>Réservé</strong><br>
                                    <small>À valider</small>
                                </td>
                                <td></td>
                                <td class="bg-success text-white">
                                    <strong>Curie Marie</strong><br>
                                    <small>Salle 201</small>
                                </td>
                            </tr>
                            <tr>
                                <td class="table-secondary fw-bold">08:30</td>
                                <td class="bg-success text-white">
                                    <strong>Dupont Jean</strong><br>
                                    <small>Suite</small>
                                </td>
                                <td class="bg-info text-white">
                                    <strong>Martin Pierre</strong><br>
                                    <small>Salle 202</small>
                                </td>
                                <td></td>
                                <td class="bg-success text-white">
                                    <strong>Bernard Paul</strong><br>
                                    <small>Salle 201</small>
                                </td>
                                <td class="bg-success text-white">
                                    <strong>Curie Marie</strong><br>
                                    <small>Suite</small>
                                </td>
                            </tr>
                            <tr>
                                <td class="table-secondary fw-bold">09:00</td>
                                <td></td>
                                <td class="bg-info text-white">
                                    <strong>Martin Pierre</strong><br>
                                    <small>Suite</small>
                                </td>
                                <td class="bg-success text-white">
                                    <strong>Dubois Alice</strong><br>
                                    <small>Salle 201</small>
                                </td>
                                <td class="bg-success text-white">
                                    <strong>Bernard Paul</strong><br>
                                    <small>Suite</small>
                                </td>
                                <td></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="row mt-4">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h6 class="mb-0">Légende</h6>
                        </div>
                        <div class="card-body">
                            <div class="d-flex gap-3 flex-wrap">
                                <span class="badge bg-success">Consultation confirmée</span>
                                <span class="badge bg-warning">Réservation à valider</span>
                                <span class="badge bg-info">Nouveau patient</span>
                                <span class="badge bg-danger">Annulé</span>
                                <span class="badge bg-secondary">Libre</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>