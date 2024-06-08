document.addEventListener('DOMContentLoaded', function() {
    fetchVentas(); // Mostrar todas las ventas al cargar

    document.getElementById('buscar').addEventListener('click', fetchVentas);
    document.getElementById('restablecer').addEventListener('click', resetFilters);
});

function fetchVentas() {
    const producto = document.getElementById('producto').value.trim();
    const fecha = document.getElementById('fecha').value.trim();
    const categoria = document.getElementById('categoria').value.trim();

    fetch('ventas.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ producto, fecha, categoria }),
    })
    .then(response => response.json())
    .then(data => {
        renderVentas(data);
    })
    .catch(error => console.error('Error:', error));
}

function renderVentas(ventas) {
    const tableContainer = document.getElementById('resultados');
    tableContainer.innerHTML = ''; // Limpiar

    const table = document.createElement('table');
    table.className = 'table table-striped';

    const thead = document.createElement('thead');
    thead.innerHTML = `
        <tr>
            <th>Venta</th>
            <th>Fecha</th>
            <th>Consultor</th>
            <th>Producto</th>
            <th>Total</th>
            <th>Acción</th>
        </tr>
    `;
    table.appendChild(thead);

    const tbody = document.createElement('tbody');
    ventas.forEach(venta => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>Venta ${venta.cVenta}</td>
            <td>${venta.Fecha}</td>
            <td>${venta.Consultora}</td>
            <td>${venta.Producto}</td>
            <td>${venta.Total}</td>
            <td><button class="btn btn-primary">Ver Detalles</button></td>
        `;
        tbody.appendChild(row);
    });

    table.appendChild(tbody);
    tableContainer.appendChild(table);
}

function resetFilters() {
    document.getElementById('producto').value = '';
    document.getElementById('fecha').value = '';
    document.getElementById('categoria').value = '';
    fetchVentas();
}
