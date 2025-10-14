<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Statistiques"/>
</jsp:include>

<div class="container-fluid">
    <div class="row">
        <jsp:include page="sidebar-admin.jsp">
            <jsp:param name="active" value="statistics"/>
        </jsp:include>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2 fw-bold text-primary">Statistiques de la Clinique</h1>
                <div class="btn-toolbar mb-2 mb-md-0">
                    <select class="form-select form-select-sm">
                        <option>Ce mois</option>
                        <option>Ce trimestre</option>
                        <option>Cette année</option>
                    </select>
                </div>
            </div>

            <!-- Indicateurs -->
            <div class="row mb-4">
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-primary shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                        Patients total
                                    </div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">1,248</div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-users fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-success shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                        Consultations/mois
                                    </div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">156</div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-stethoscope fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-warning shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                        Taux de remplissage
                                    </div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">78%</div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-percentage fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-info shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                        Revenus/mois
                                    </div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">€45,600</div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-euro-sign fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-8">
                    <div class="card shadow mb-4">
                        <div class="card-header bg-white py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Consultations par département</h6>
                        </div>
                        <div class="card-body">
                            <!-- Graphique simulé -->
                            <div class="chart-container text-center py-4">
                                <div class="d-flex align-items-end justify-content-center h-100 gap-4">
                                    <div class="d-flex flex-column align-items-center">
                                        <div class="bg-primary mb-2" style="width: 60px; height: 120px;"></div>
                                        <small>Cardio</small>
                                        <strong>85</strong>
                                    </div>
                                    <div class="d-flex flex-column align-items-center">
                                        <div class="bg-success mb-2" style="width: 60px; height: 90px;"></div>
                                        <small>Dermato</small>
                                        <strong>62</strong>
                                    </div>
                                    <div class="d-flex flex-column align-items-center">
                                        <div class="bg-warning mb-2" style="width: 60px; height: 70px;"></div>
                                        <small>Pédiatrie</small>
                                        <strong>45</strong>
                                    </div>
                                    <div class="d-flex flex-column align-items-center">
                                        <div class="bg-info mb-2" style="width: 60px; height: 50px;"></div>
                                        <small>Neuro</small>
                                        <strong>38</strong>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4">
                    <div class="card shadow mb-4">
                        <div class="card-header bg-white py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Répartition des statuts</h6>
                        </div>
                        <div class="card-body">
                            <div class="text-center mb-4">
                                <div class="bg-primary text-white rounded-circle d-inline-flex align-items-center justify-content-center mb-3"
                                     style="width: 120px; height: 120px;">
                                    <div>
                                        <strong>156</strong><br>
                                        <small>Total</small>
                                    </div>
                                </div>
                            </div>
                            <div class="legend">
                                <div class="d-flex align-items-center mb-2">
                                    <div class="bg-success rounded me-2" style="width: 20px; height: 20px;"></div>
                                    <span>Terminées (65%)</span>
                                </div>
                                <div class="d-flex align-items-center mb-2">
                                    <div class="bg-primary rounded me-2" style="width: 20px; height: 20px;"></div>
                                    <span>Confirmées (20%)</span>
                                </div>
                                <div class="d-flex align-items-center mb-2">
                                    <div class="bg-warning rounded me-2" style="width: 20px; height: 20px;"></div>
                                    <span>Réservées (10%)</span>
                                </div>
                                <div class="d-flex align-items-center mb-2">
                                    <div class="bg-danger rounded me-2" style="width: 20px; height: 20px;"></div>
                                    <span>Annulées (5%)</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<jsp:include page="../common/footer.jsp"/>