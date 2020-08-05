package controller;

import bo.ProductBo;
import bo.ProductBoImpl;
import model.Product;
import dao.ProductDao;
import dao.ProductDaoImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = "/products")
public class ProductServlet extends HttpServlet {

    ProductDao productDao = new ProductDaoImpl();
    ProductBo productBo = new ProductBoImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        String search = request.getParameter("search");
        if (search!=null) {
            showSearchProduct(request,response);
        }
        switch (action) {
            case "create":
                createProduct(request, response);
                break;
            case "update":
                updateProduct(request, response);
                listProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                listProduct(request, response);
                break;
            default:
                listProduct(request, response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateProduct(request, response);
                break;
            case "view":
                showProduct(request, response);
                break;
            case "update":
                showUpdateProduct(request, response);
                break;
            case "delete":
                showDeleteProduct(request, response);
                break;
            default:
                listProduct(request, response);
        }
    }

    protected void listProduct(HttpServletRequest request, HttpServletResponse response) {
        List<Product> products = this.productDao.findAll();
        request.setAttribute("products", products);
        try {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/product/listAll.jsp");
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateProduct(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void showDeleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int productId = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("products",this.productDao.findById(productId));
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/delete.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void showUpdateProduct(HttpServletRequest request, HttpServletResponse response) {
        int productId = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("products",this.productDao.findById(productId));
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/update.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showProduct(HttpServletRequest request, HttpServletResponse response) {
        int productId = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("products",this.productDao.findById(productId));
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/view.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showSearchProduct(HttpServletRequest request, HttpServletResponse response) {
        String searchName = request.getParameter("search");
        List<Product> searchProduct = new ArrayList<>();
        for (Product product: this.productDao.findAll()) {
            if (product.getProductName().toLowerCase().contains(searchName.toLowerCase())) {
                searchProduct.add(product);
            }
        }

        request.setAttribute("products",searchProduct);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/product/listAll.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) {
        int productId = Integer.parseInt(request.getParameter("id"));
        String productName = request.getParameter("productName");
        String productPrice = request.getParameter("productPrice");
        String productDesc = request.getParameter("productDesc");
        String productMaker = request.getParameter("productMaker");
        if (this.productBo.checkValidName(productName)) {
            this.productDao.save(new Product(productId, productName, productPrice, productDesc, productMaker));
        } else {
            request.setAttribute("invalidProductName","invalid");
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/update.jsp");
            try {
                requestDispatcher.forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int productId = Integer.parseInt(request.getParameter("id"));
        this.productDao.remove(productId);
    }

    protected void createProduct(HttpServletRequest request, HttpServletResponse response) {
        String productName = request.getParameter("productName");
        String productPrice = request.getParameter("productPrice");
        String productDesc = request.getParameter("productDesc");
        String productMaker = request.getParameter("productMaker");

        if (this.productBo.checkValidName(productName)) {
            this.productDao.save(new Product(this.productDao.nextId(), productName, productPrice, productDesc, productMaker));
            request.setAttribute("invalidProductName","valid");
        } else {
            request.setAttribute("invalidProductName","invalid");
        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
