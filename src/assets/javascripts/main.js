import Amber from "amber";

document.addEventListener("DOMContentLoaded", () => {
  (document.querySelectorAll(".notification .delete") || []).forEach($delete => {
    const notification = $delete.parentNode;

    $delete.addEventListener("click", () => {
      notification.parentNode.removeChild(notification);
    });
  });

  (document.querySelectorAll("tr.clickable") || []).forEach(row => {
    row.addEventListener("click", () => {
      window.location = row.getAttribute("data-href");
    });
  });
});
