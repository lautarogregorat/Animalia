import * as React from "react";
import PropTypes from "prop-types";
import { alpha } from "@mui/material/styles";
import Box from "@mui/material/Box";
import Table from "@mui/material/Table";
import TableBody from "@mui/material/TableBody";
import TableCell from "@mui/material/TableCell";
import TableContainer from "@mui/material/TableContainer";
import TableHead from "@mui/material/TableHead";
import TablePagination from "@mui/material/TablePagination";
import TableRow from "@mui/material/TableRow";
import TableSortLabel from "@mui/material/TableSortLabel";
import Toolbar from "@mui/material/Toolbar";
import Typography from "@mui/material/Typography";
import Paper from "@mui/material/Paper";
import Checkbox from "@mui/material/Checkbox";
import IconButton from "@mui/material/IconButton";
import Tooltip from "@mui/material/Tooltip";
import FormControlLabel from "@mui/material/FormControlLabel";
import Switch from "@mui/material/Switch";
import DeleteIcon from "@mui/icons-material/Delete";
import FilterListIcon from "@mui/icons-material/FilterList";
import { visuallyHidden } from "@mui/utils";
import BotonesLista from "./Botones/BotonesLista";
import BuscarPacienteBarra from "./Pacientes/BuscarPacienteBarra";
import { useState } from "react";
import { useMemo } from "react";
import axios from "axios";
import { Skeleton } from "@mui/material";
import { format } from "date-fns";
import { Button } from "@mui/material";
import SimpleBackdrop from "./SimpleBackdrop";
import { useAuth } from "../context/AuthContext";
import Dialog from "@mui/material/Dialog";
import DialogTitle from "@mui/material/DialogTitle";
import DialogContent from "@mui/material/DialogContent";
import DialogContentText from "@mui/material/DialogContentText";
import DialogActions from "@mui/material/DialogActions";



function descendingComparator(a, b, orderBy) {
  const getNestedPropertyValue = (obj, path) => {
    const keys = path.split(".");
    return keys.reduce(
      (acc, key) => (acc && acc[key] !== undefined ? acc[key] : undefined),
      obj
    );
  };

  const valueA = getNestedPropertyValue(a, orderBy);
  const valueB = getNestedPropertyValue(b, orderBy);

  if (valueB < valueA) {
    return -1;
  }
  if (valueB > valueA) {
    return 1;
  }
  return 0;
}

function getComparator(order, orderBy) {
  return order === "desc"
    ? (a, b) => descendingComparator(a, b, orderBy)
    : (a, b) => -descendingComparator(a, b, orderBy);
}

// Since 2020 all major browsers ensure sort stability with Array.prototype.sort().
// stableSort() brings sort stability to non-modern browsers (notably IE11). If you
// only support modern browsers you can replace stableSort(exampleArray, exampleComparator)
// with exampleArray.slice().sort(exampleComparator)
function stableSort(array, comparator) {
  const stabilizedThis = array.map((el, index) => [el, index]);
  stabilizedThis.sort((a, b) => {
    const order = comparator(a[0], b[0]);
    if (order !== 0) {
      return order;
    }
    return a[1] - b[1];
  });
  return stabilizedThis.map((el) => el[0]);
}

const headCells = [
  {
    id: "nombre",
    numeric: false,
    disablePadding: true,
    label: "Nombre",
  },
  {
    id: "responsablesByResponsableId.nombre",
    numeric: false,
    disablePadding: true,
    label: "Responsable",
  },
  {
    id: "fechaUltVisita",
    numeric: false,
    disablePadding: true,
    label: "Ultima Visita",
  },
  {
    id: "carbs",
    numeric: true,
    disablePadding: true,
    label: "Acciones",
  },
];

function EnhancedTableHead(props) {
  const {
    onSelectAllClick,
    order,
    orderBy,
    numSelected,
    rowCount,
    onRequestSort,
  } = props;
  const createSortHandler = (property) => (event) => {
    onRequestSort(event, property);
  };

  return (
    <TableHead>
      <TableRow>
        <TableCell padding="checkbox">
          <Checkbox
            color="primary"
            indeterminate={numSelected > 0 && numSelected < rowCount}
            checked={rowCount > 0 && numSelected === rowCount}
            onChange={onSelectAllClick}
            inputProps={{
              "aria-label": "select all desserts",
            }}
          />
        </TableCell>
        {headCells.map((headCell) => (
          <TableCell
            key={headCell.id}
            align={headCell.numeric ? "right" : "left"}
            padding={headCell.disablePadding ? "none" : "normal"}
            sortDirection={orderBy === headCell.id ? order : false}
            sx={{ textAlign: "center" }}
          >
            <TableSortLabel
              active={orderBy === headCell.id}
              direction={orderBy === headCell.id ? order : "asc"}
              onClick={createSortHandler(headCell.id)}
            >
              {headCell.label}
              {orderBy === headCell.id ? (
                <Box component="span" sx={visuallyHidden}>
                  {order === "desc" ? "sorted descending" : "sorted ascending"}
                </Box>
              ) : null}
            </TableSortLabel>
          </TableCell>
        ))}
      </TableRow>
    </TableHead>
  );
}

EnhancedTableHead.propTypes = {
  numSelected: PropTypes.number.isRequired,
  onRequestSort: PropTypes.func.isRequired,
  onSelectAllClick: PropTypes.func.isRequired,
  order: PropTypes.oneOf(["asc", "desc"]).isRequired,
  orderBy: PropTypes.string.isRequired,
  rowCount: PropTypes.number.isRequired,
};

function EnhancedTableToolbar(props) {
  const { numSelected, idPaciente, setRefresh, setSelected, setRows } = props;
  const [openConfirm, setOpenConfirm] = React.useState(false);
  const [openSuccess, setOpenSuccess] = React.useState(false);
  // Estado para el backdrop
  const [openBackdrop, setOpenBackdrop] = useState(false);
  const authContext = useAuth();

  const handleSubmit = async (event) => {
    event.preventDefault();
    setOpenConfirm(true);
  };

  const eliminarPaciente = async () => {
    setOpenConfirm(false);
    setRefresh(true);
    setOpenBackdrop(true);
    try {
      const response = await axios.delete(
        `http://localhost:8080/api/pacientes/${idPaciente}`,
        { headers: { Authorization: `Bearer ${authContext.keycloak.token}` } }
      );
      if (response.status === 200) {
        setOpenBackdrop(false);
        setOpenSuccess(true);
        // Actualiza el estado de la selección de filas aquí
        setSelected((prevSelected) =>
          prevSelected.filter((id) => id !== idPaciente)
        );
        // Obtiene la lista actualizada de pacientes
        const response = await axios.get(
          "http://localhost:8080/api/pacientes",
          { headers: { Authorization: `Bearer ${authContext.keycloak.token}` } }
        );
        setRows(response.data);
      }
    } catch (error) {
      console.error(error);
    }
  };

  return (
    <>
      <Toolbar
        sx={{
          pl: { sm: 2 },
          pr: { xs: 1, sm: 1 },
          ...(numSelected > 0 && {
            bgcolor: (theme) =>
              alpha(
                theme.palette.primary.main,
                theme.palette.action.activatedOpacity
              ),
          }),
        }}
      >
        {numSelected > 0 ? (
          <Typography
            sx={{ flex: "1 1 100%" }}
            color="inherit"
            variant="subtitle1"
            component="div"
          >
            {numSelected} selected
          </Typography>
        ) : (
          <Typography
            sx={{ flex: "1 1 100%" }}
            variant="h6"
            id="tableTitle"
            component="div"
          >
            Pacientes
          </Typography>
        )}

        {numSelected > 0 ? (
          <Tooltip title="Delete">
            <IconButton onClick={handleSubmit}>
              <DeleteIcon />
            </IconButton>
          </Tooltip>
        ) : (
          <Tooltip title="Filter list">
            <IconButton>
              <FilterListIcon />
            </IconButton>
          </Tooltip>
        )}
      </Toolbar>
      <SimpleBackdrop open={openBackdrop} />

      <Dialog
        open={openConfirm}
        onClose={() => setOpenConfirm(false)}
        aria-labelledby="confirm-dialog"
      >
        <DialogTitle id="confirm-dialog">Confirmar Eliminacion</DialogTitle>
        <DialogContent>
          <DialogContentText id="confirm-dialog-description">
            ¿Está seguro que eliminar el paciente?
          </DialogContentText>
        </DialogContent>
        <DialogActions>
          <Button onClick={() => setOpenConfirm(false)} color="primary">
            No
          </Button>
          <Button onClick={eliminarPaciente} color="primary" autoFocus>
            Sí
          </Button>
        </DialogActions>
      </Dialog>
      <Dialog open={openSuccess} onClose={() => setOpenSuccess(false)}>
        <DialogTitle id="success-dialog">Eliminacion exitosa</DialogTitle>
        <DialogContent>
          <DialogContentText id="success-dialog-description">
            El paciente se elimino exitosamente.
          </DialogContentText>
        </DialogContent>
        <DialogActions>
          <Button
            onClick={() => {
              setOpenSuccess(false);
            }}
            color="primary"
          >
            Ok
          </Button>
        </DialogActions>
      </Dialog>
    </>
  );
}

EnhancedTableToolbar.propTypes = {
  numSelected: PropTypes.number.isRequired,
  setSelected: PropTypes.func.isRequired,
  setRefresh: PropTypes.func.isRequired,
};

function EnhancedTable() {
  const [rows, setRows] = useState([]);
  const [order, setOrder] = React.useState("asc");
  const [orderBy, setOrderBy] = React.useState("calories");
  const [selected, setSelected] = React.useState([]);
  const [page, setPage] = React.useState(0);
  const [dense, setDense] = React.useState(false);
  const [rowsPerPage, setRowsPerPage] = React.useState(5);
  const [searchTerm, setSearchTerm] = useState("");
  const [idSeleccionado, setIdSeleccionado] = useState(0);
  const [refresh, setRefresh] = useState(false);
  const authContext = useAuth();

  const formatDate = (dateString) => {
    if (!dateString) return "Aun no hay una visita registrada";
    const formattedDate = format(new Date(dateString), "dd/MM/yyyy HH:mm");
    return formattedDate;
  };

  /*useEffect(() => {
    if (refresh) {
      const getRows = async () => {
        try {
          const response = await axios.get('http://localhost:8080/api/pacientes');
          setRows(response.data);
          console.log(response.data);
        } catch (error) {
          console.error(error);
        }
      }
      getRows();
      
    }
    setRefresh(false);
  }, [refresh])*/

  React.useEffect(() => {
    const getRows = async () => {
      try {
        const response = await axios.get(
          "http://localhost:8080/api/pacientes",
          { headers: { Authorization: `Bearer ${authContext.keycloak.token}` } }
        );
        setRows(response.data);
      } catch (error) {
        console.error(error);
      }
    };
    getRows();
  }, []);

  // Filtra las filas basándose en el término de búsqueda
  const filteredRows = useMemo(() => {
    return rows.filter((row) =>
      row.nombre.toLowerCase().includes(searchTerm.toLowerCase())
    );
  }, [rows, searchTerm]);

  const handleRequestSort = (event, property) => {
    const isAsc = orderBy === property && order === "asc";
    setOrder(isAsc ? "desc" : "asc");
    setOrderBy(property);
  };

  const handleSelectAllClick = (event) => {
    if (event.target.checked) {
      const newSelected = filteredRows.map((n) => n.idPaciente);
      setSelected(newSelected);
      return;
    }
    setSelected([]);
  };

  const handleClick = (event, id) => {
    // Verificar si el clic fue en el botón
    const isButtonClick = event.target.tagname === "BUTTON";

    // Evitar la selección si fue un clic en el botón
    if (isButtonClick) {
      event.stopPropagation();
      return;
    }

    const selectedIndex = selected.indexOf(id);
    let newSelected = [];

    if (selectedIndex === -1) {
      newSelected = newSelected.concat(selected, id);
    } else if (selectedIndex === 0) {
      newSelected = newSelected.concat(selected.slice(1));
    } else if (selectedIndex === selected.length - 1) {
      newSelected = newSelected.concat(selected.slice(0, -1));
    } else if (selectedIndex > 0) {
      newSelected = newSelected.concat(
        selected.slice(0, selectedIndex),
        selected.slice(selectedIndex + 1)
      );
    }
    setSelected(newSelected);
    setIdSeleccionado(id);
  };

  const handleChangePage = (event, newPage) => {
    setPage(newPage);
  };

  const handleChangeRowsPerPage = (event) => {
    setRowsPerPage(parseInt(event.target.value, 10));
    setPage(0);
  };

  const handleChangeDense = (event) => {
    setDense(event.target.checked);
  };

  const isSelected = (id) => selected.indexOf(id) !== -1;

  // Calcula las filas visibles basándose en la página actual y las filas por página
  // ... (resto del código)

  const visibleRows = useMemo(
    () =>
      stableSort(filteredRows, getComparator(order, orderBy)).slice(
        page * rowsPerPage,
        page * rowsPerPage + rowsPerPage
      ),
    [filteredRows, order, orderBy, page, rowsPerPage]
  );

  // ... (resto del código)

  // Calcula el número de filas vacías para evitar saltos de diseño en la última página
  const emptyRows =
    rowsPerPage -
    Math.min(rowsPerPage, filteredRows.length - page * rowsPerPage);

  const loading = !rows.length;
  // Renderizar esqueletos mientras los datos se están cargando o si la tabla está vacía
  if (loading) {
    const skeletonRows = Array.from({ length: rowsPerPage }, (_, index) => (
      <TableRow key={index}>
        <TableCell padding="checkbox">
          <Checkbox
            color="primary"
            inputProps={{ "aria-label": "select skeleton" }}
          />
        </TableCell>
        <TableCell>
          <Skeleton variant="text" width="80%" />
        </TableCell>
        <TableCell>
          <Skeleton variant="text" width="80%" />
        </TableCell>
        <TableCell>
          <Skeleton variant="text" width="80%" />
        </TableCell>
        <TableCell>
          <Skeleton variant="rect" width={100} height={24} />
        </TableCell>
      </TableRow>
    ));

    return (
      <Box sx={{ width: "100%" }}>
        <BuscarPacienteBarra onSearch={setSearchTerm} value={searchTerm} />
        <Paper sx={{ width: "100%", mb: 2, marginTop: "120px" }}>
          <TableContainer>
            <Table
              sx={{ minWidth: 450 }}
              aria-labelledby="tableTitle"
              size={dense ? "small" : "medium"}
            >
              <TableBody>{skeletonRows}</TableBody>
            </Table>
          </TableContainer>
          <TablePagination
            rowsPerPageOptions={[5, 10, 15]}
            component="div"
            count={rowsPerPage}
            rowsPerPage={rowsPerPage}
            page={0} // Página siempre en 0 durante la carga
            onPageChange={() => {}} // Función vacía durante la carga
            onRowsPerPageChange={() => {}} // Función vacía durante la carga
          />
        </Paper>
        <FormControlLabel
          control={<Switch checked={dense} onChange={handleChangeDense} />}
          label="Dense padding"
        />
      </Box>
    );
  }
  return (
    <Box sx={{ width: "100%" }}>
      <BuscarPacienteBarra onSearch={setSearchTerm} value={searchTerm} />
      <Paper sx={{ width: "100%", mb: 2, marginTop: "40px" }}>
        <EnhancedTableToolbar
          setRefresh={setRefresh}
          numSelected={selected.length}
          idPaciente={idSeleccionado}
          setSelected={setSelected}
          setRows={setRows}
        />
        <TableContainer>
          <Table
            sx={{
              minWidth: 450,
              // Ajusta la opacidad aquí
            }}
            aria-labelledby="tableTitle"
            size={dense ? "small" : "medium"}
          >
            <EnhancedTableHead
              numSelected={selected.length}
              order={order}
              orderBy={orderBy}
              onSelectAllClick={handleSelectAllClick}
              onRequestSort={handleRequestSort}
              rowCount={filteredRows.length}
            />
            <TableBody>
              {visibleRows.map((row, index) => {
                const isItemSelected = isSelected(row.idPaciente);
                const labelId = `enhanced-table-checkbox-${index}`;

                return (
                  <TableRow
                    hover
                    onClick={(event) => handleClick(event, row.idPaciente)}
                    role="checkbox"
                    aria-checked={isItemSelected}
                    tabIndex={-1}
                    key={row.idPaciente}
                    selected={isItemSelected}
                    sx={{ cursor: "pointer" }}
                  >
                    <TableCell padding="checkbox">
                      <Checkbox
                        color="primary"
                        checked={isItemSelected}
                        inputProps={{
                          "aria-labelledby": labelId,
                        }}
                      />
                    </TableCell>
                    <TableCell
                      align="center"
                      component="th"
                      id={labelId}
                      scope="row"
                      padding="none"
                      style={{ width: "25%" }} // Ajusta este valor según tus necesidades
                    >
                      {row.nombre}
                    </TableCell>
                    <TableCell align="center">{`${row.responsablesByResponsableId.nombre} ${row.responsablesByResponsableId.apellido}`}</TableCell>
                    <TableCell align="center">
                      {" "}
                      {formatDate(row.fechaUltVisita)}
                    </TableCell>
                    <TableCell sx={{ width: "18%" }} align="right">
                      <BotonesLista id={row.idPaciente}></BotonesLista>
                    </TableCell>
                  </TableRow>
                );
              })}
              {emptyRows > 0 && (
                <TableRow
                  style={{
                    height: (dense ? 33 : 53) * emptyRows,
                  }}
                >
                  <TableCell colSpan={5} />
                </TableRow>
              )}
            </TableBody>
          </Table>
        </TableContainer>
        <TablePagination
          rowsPerPageOptions={[5, 10, 15]}
          component="div"
          count={filteredRows.length}
          rowsPerPage={rowsPerPage}
          page={page}
          onPageChange={handleChangePage}
          onRowsPerPageChange={handleChangeRowsPerPage}
        />
      </Paper>
      <FormControlLabel
        control={<Switch checked={dense} onChange={handleChangeDense} />}
        label="Dense padding"
      />
    </Box>
  );
}

export default function Lista() {
  return <EnhancedTable />;
}
