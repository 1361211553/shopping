package com.shopping.entity;

import java.util.ArrayList;
import java.util.List;

public class SOrderdetailExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public SOrderdetailExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andOrderdetailidIsNull() {
            addCriterion("orderdetailid is null");
            return (Criteria) this;
        }

        public Criteria andOrderdetailidIsNotNull() {
            addCriterion("orderdetailid is not null");
            return (Criteria) this;
        }

        public Criteria andOrderdetailidEqualTo(Integer value) {
            addCriterion("orderdetailid =", value, "orderdetailid");
            return (Criteria) this;
        }

        public Criteria andOrderdetailidNotEqualTo(Integer value) {
            addCriterion("orderdetailid <>", value, "orderdetailid");
            return (Criteria) this;
        }

        public Criteria andOrderdetailidGreaterThan(Integer value) {
            addCriterion("orderdetailid >", value, "orderdetailid");
            return (Criteria) this;
        }

        public Criteria andOrderdetailidGreaterThanOrEqualTo(Integer value) {
            addCriterion("orderdetailid >=", value, "orderdetailid");
            return (Criteria) this;
        }

        public Criteria andOrderdetailidLessThan(Integer value) {
            addCriterion("orderdetailid <", value, "orderdetailid");
            return (Criteria) this;
        }

        public Criteria andOrderdetailidLessThanOrEqualTo(Integer value) {
            addCriterion("orderdetailid <=", value, "orderdetailid");
            return (Criteria) this;
        }

        public Criteria andOrderdetailidIn(List<Integer> values) {
            addCriterion("orderdetailid in", values, "orderdetailid");
            return (Criteria) this;
        }

        public Criteria andOrderdetailidNotIn(List<Integer> values) {
            addCriterion("orderdetailid not in", values, "orderdetailid");
            return (Criteria) this;
        }

        public Criteria andOrderdetailidBetween(Integer value1, Integer value2) {
            addCriterion("orderdetailid between", value1, value2, "orderdetailid");
            return (Criteria) this;
        }

        public Criteria andOrderdetailidNotBetween(Integer value1, Integer value2) {
            addCriterion("orderdetailid not between", value1, value2, "orderdetailid");
            return (Criteria) this;
        }

        public Criteria andPidIsNull() {
            addCriterion("pid is null");
            return (Criteria) this;
        }

        public Criteria andPidIsNotNull() {
            addCriterion("pid is not null");
            return (Criteria) this;
        }

        public Criteria andPidEqualTo(Integer value) {
            addCriterion("pid =", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidNotEqualTo(Integer value) {
            addCriterion("pid <>", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidGreaterThan(Integer value) {
            addCriterion("pid >", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidGreaterThanOrEqualTo(Integer value) {
            addCriterion("pid >=", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidLessThan(Integer value) {
            addCriterion("pid <", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidLessThanOrEqualTo(Integer value) {
            addCriterion("pid <=", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidIn(List<Integer> values) {
            addCriterion("pid in", values, "pid");
            return (Criteria) this;
        }

        public Criteria andPidNotIn(List<Integer> values) {
            addCriterion("pid not in", values, "pid");
            return (Criteria) this;
        }

        public Criteria andPidBetween(Integer value1, Integer value2) {
            addCriterion("pid between", value1, value2, "pid");
            return (Criteria) this;
        }

        public Criteria andPidNotBetween(Integer value1, Integer value2) {
            addCriterion("pid not between", value1, value2, "pid");
            return (Criteria) this;
        }

        public Criteria andOidIsNull() {
            addCriterion("oid is null");
            return (Criteria) this;
        }

        public Criteria andOidIsNotNull() {
            addCriterion("oid is not null");
            return (Criteria) this;
        }

        public Criteria andOidEqualTo(String value) {
            addCriterion("oid =", value, "oid");
            return (Criteria) this;
        }

        public Criteria andOidNotEqualTo(String value) {
            addCriterion("oid <>", value, "oid");
            return (Criteria) this;
        }

        public Criteria andOidGreaterThan(String value) {
            addCriterion("oid >", value, "oid");
            return (Criteria) this;
        }

        public Criteria andOidGreaterThanOrEqualTo(String value) {
            addCriterion("oid >=", value, "oid");
            return (Criteria) this;
        }

        public Criteria andOidLessThan(String value) {
            addCriterion("oid <", value, "oid");
            return (Criteria) this;
        }

        public Criteria andOidLessThanOrEqualTo(String value) {
            addCriterion("oid <=", value, "oid");
            return (Criteria) this;
        }

        public Criteria andOidLike(String value) {
            addCriterion("oid like", value, "oid");
            return (Criteria) this;
        }

        public Criteria andOidNotLike(String value) {
            addCriterion("oid not like", value, "oid");
            return (Criteria) this;
        }

        public Criteria andOidIn(List<String> values) {
            addCriterion("oid in", values, "oid");
            return (Criteria) this;
        }

        public Criteria andOidNotIn(List<String> values) {
            addCriterion("oid not in", values, "oid");
            return (Criteria) this;
        }

        public Criteria andOidBetween(String value1, String value2) {
            addCriterion("oid between", value1, value2, "oid");
            return (Criteria) this;
        }

        public Criteria andOidNotBetween(String value1, String value2) {
            addCriterion("oid not between", value1, value2, "oid");
            return (Criteria) this;
        }

        public Criteria andPpurchasenumIsNull() {
            addCriterion("ppurchasenum is null");
            return (Criteria) this;
        }

        public Criteria andPpurchasenumIsNotNull() {
            addCriterion("ppurchasenum is not null");
            return (Criteria) this;
        }

        public Criteria andPpurchasenumEqualTo(Integer value) {
            addCriterion("ppurchasenum =", value, "ppurchasenum");
            return (Criteria) this;
        }

        public Criteria andPpurchasenumNotEqualTo(Integer value) {
            addCriterion("ppurchasenum <>", value, "ppurchasenum");
            return (Criteria) this;
        }

        public Criteria andPpurchasenumGreaterThan(Integer value) {
            addCriterion("ppurchasenum >", value, "ppurchasenum");
            return (Criteria) this;
        }

        public Criteria andPpurchasenumGreaterThanOrEqualTo(Integer value) {
            addCriterion("ppurchasenum >=", value, "ppurchasenum");
            return (Criteria) this;
        }

        public Criteria andPpurchasenumLessThan(Integer value) {
            addCriterion("ppurchasenum <", value, "ppurchasenum");
            return (Criteria) this;
        }

        public Criteria andPpurchasenumLessThanOrEqualTo(Integer value) {
            addCriterion("ppurchasenum <=", value, "ppurchasenum");
            return (Criteria) this;
        }

        public Criteria andPpurchasenumIn(List<Integer> values) {
            addCriterion("ppurchasenum in", values, "ppurchasenum");
            return (Criteria) this;
        }

        public Criteria andPpurchasenumNotIn(List<Integer> values) {
            addCriterion("ppurchasenum not in", values, "ppurchasenum");
            return (Criteria) this;
        }

        public Criteria andPpurchasenumBetween(Integer value1, Integer value2) {
            addCriterion("ppurchasenum between", value1, value2, "ppurchasenum");
            return (Criteria) this;
        }

        public Criteria andPpurchasenumNotBetween(Integer value1, Integer value2) {
            addCriterion("ppurchasenum not between", value1, value2, "ppurchasenum");
            return (Criteria) this;
        }

        public Criteria andPtotalpriceIsNull() {
            addCriterion("ptotalprice is null");
            return (Criteria) this;
        }

        public Criteria andPtotalpriceIsNotNull() {
            addCriterion("ptotalprice is not null");
            return (Criteria) this;
        }

        public Criteria andPtotalpriceEqualTo(Double value) {
            addCriterion("ptotalprice =", value, "ptotalprice");
            return (Criteria) this;
        }

        public Criteria andPtotalpriceNotEqualTo(Double value) {
            addCriterion("ptotalprice <>", value, "ptotalprice");
            return (Criteria) this;
        }

        public Criteria andPtotalpriceGreaterThan(Double value) {
            addCriterion("ptotalprice >", value, "ptotalprice");
            return (Criteria) this;
        }

        public Criteria andPtotalpriceGreaterThanOrEqualTo(Double value) {
            addCriterion("ptotalprice >=", value, "ptotalprice");
            return (Criteria) this;
        }

        public Criteria andPtotalpriceLessThan(Double value) {
            addCriterion("ptotalprice <", value, "ptotalprice");
            return (Criteria) this;
        }

        public Criteria andPtotalpriceLessThanOrEqualTo(Double value) {
            addCriterion("ptotalprice <=", value, "ptotalprice");
            return (Criteria) this;
        }

        public Criteria andPtotalpriceIn(List<Double> values) {
            addCriterion("ptotalprice in", values, "ptotalprice");
            return (Criteria) this;
        }

        public Criteria andPtotalpriceNotIn(List<Double> values) {
            addCriterion("ptotalprice not in", values, "ptotalprice");
            return (Criteria) this;
        }

        public Criteria andPtotalpriceBetween(Double value1, Double value2) {
            addCriterion("ptotalprice between", value1, value2, "ptotalprice");
            return (Criteria) this;
        }

        public Criteria andPtotalpriceNotBetween(Double value1, Double value2) {
            addCriterion("ptotalprice not between", value1, value2, "ptotalprice");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}